using HMS.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;

namespace HMS.Controllers
{
    public class PatientController : Controller
    {
        private IConfiguration _configuration;
        public PatientController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public IActionResult PatientList()
        {
            string ConnectionString = this._configuration.GetConnectionString(name: "MyConnectionString");
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();
            SqlCommand command = sqlConnection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Patient_SelectAll";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            return View(table);
        }

        //Delete method
        public IActionResult PatientDelete(int @PatientID)
        {
            string ConnectionString = this._configuration.GetConnectionString(name: "MyConnectionString");
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();

            SqlCommand command = sqlConnection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Patient_DeleteByPK";
            command.Parameters.Add("@PatientID", SqlDbType.Int).Value = @PatientID;
            command.ExecuteNonQuery();
            return RedirectToAction("PatientList");
        }
        public IActionResult PatientAddEdit(PatientModel patientModel)
        {
            if (ModelState.IsValid)
            {
                string ConnectionString = this._configuration.GetConnectionString(name: "MyConnectionString");
                SqlConnection sqlConnection = new SqlConnection(ConnectionString);
                sqlConnection.Open();
                SqlCommand command = sqlConnection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_Patient_Insert";
                command.Parameters.Add("@Name", SqlDbType.NVarChar).Value = patientModel.Name;
                command.Parameters.Add("@DateOfBirth", SqlDbType.DateTime).Value = patientModel.DateOfBirth;
                command.Parameters.Add("@Gender", SqlDbType.NVarChar).Value = patientModel.Gender;
                command.Parameters.Add("@Email", SqlDbType.NVarChar).Value = patientModel.Email;
                command.Parameters.Add("@Phone", SqlDbType.NVarChar).Value = patientModel.Phone;
                command.Parameters.Add("@Address", SqlDbType.NVarChar).Value = patientModel.Address;
                command.Parameters.Add("@City", SqlDbType.NVarChar).Value = patientModel.City;
                command.Parameters.Add("@State", SqlDbType.NVarChar).Value = patientModel.State;
                command.Parameters.Add("@IsActive", SqlDbType.Bit).Value = patientModel.IsActive;
                //command.Parameters.Add("@Created", SqlDbType.DateTime).Value = DateTime.Now;
                //command.Parameters.Add("@Modified", SqlDbType.DateTime).Value = DateTime.Now;
                command.Parameters.Add("@UserID", SqlDbType.Int).Value = 1;
                if (patientModel.PatientID > 0)
                {
                    command.CommandText = "PR_Patient_UpdateByPK";
                    command.Parameters.Add("@PatientID", SqlDbType.Int).Value = patientModel.PatientID;
                }
                else
                {
                    command.CommandText = "PR_Patient_Insert";
                }
                command.ExecuteNonQuery();
                return RedirectToAction("PatientList");



            }
            return View(patientModel);
        }
        public IActionResult PatientDetail()
        {
            return View();
        }
    }
}
