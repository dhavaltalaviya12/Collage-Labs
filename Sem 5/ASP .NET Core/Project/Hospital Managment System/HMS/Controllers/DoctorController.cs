
using HMS.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;

namespace HMS.Controllers
{
    public class DoctorController : Controller
    {
        private IConfiguration _configuration;
        public DoctorController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public IActionResult DoctorList()
        {
            string ConnectionString = this._configuration.GetConnectionString(name: "MyConnectionString");
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();
            SqlCommand command = sqlConnection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Doctor_SelectAll";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            return View(table);
        }

        //Delete method
        public IActionResult DoctorDelete(int @DoctorID)
        {
            string ConnectionString = this._configuration.GetConnectionString(name: "MyConnectionString");
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();

            SqlCommand command = sqlConnection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Doctor_DeleteByPK";
            command.Parameters.Add("@DoctorID", SqlDbType.Int).Value = @DoctorID;
            command.ExecuteNonQuery();
            return RedirectToAction("DoctorList");
        }

        public IActionResult DoctorAddEdit(DoctorModel doctorModel)
        {
            if (ModelState.IsValid)
            {
                string ConnectionString = this._configuration.GetConnectionString(name: "MyConnectionString");
                SqlConnection sqlConnection = new SqlConnection(ConnectionString);
                sqlConnection.Open();
                SqlCommand command = sqlConnection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_Doctor_Insert";
                //command.Parameters.Add("@DoctorID", SqlDbType.Int).Value = doctorModel.DoctorID;
                command.Parameters.Add("@DoctorName", SqlDbType.NVarChar).Value = doctorModel.DoctorName;
                command.Parameters.Add("@Phone", SqlDbType.NVarChar).Value = doctorModel.Phone;
                command.Parameters.Add("@Email", SqlDbType.NVarChar).Value = doctorModel.Email;
                command.Parameters.Add("@Qualification", SqlDbType.NVarChar).Value = doctorModel.Qualification;
                command.Parameters.Add("@Specialization", SqlDbType.NVarChar).Value = doctorModel.Specialization;
                command.Parameters.Add("@IsActive", SqlDbType.Bit).Value = doctorModel.IsActive;
                command.Parameters.Add("@Created", SqlDbType.DateTime).Value = doctorModel.Created;
                command.Parameters.Add("@Modified", SqlDbType.DateTime).Value = doctorModel.Modified;
                command.Parameters.Add("@UserID", SqlDbType.Int).Value = 1;
                if (doctorModel.DoctorID > 0)
                {
                    command.CommandText = "PR_Doctor_UpdateByPK";
                    command.Parameters.Add("@DoctorID", SqlDbType.Int).Value = doctorModel.DoctorID;
                }
                else
                {
                    command.CommandText = "PR_Doctor_Insert";
                }
                command.ExecuteNonQuery();
                return RedirectToAction("DoctorList");



            }
            return View(doctorModel);

        }
        public IActionResult DoctorDetail()
        {
            return View();
        }

    }
}
