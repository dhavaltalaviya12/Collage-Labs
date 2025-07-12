using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;

namespace HMS.Controllers
{
    public class DoctorDepartmentController : Controller
    {
        private IConfiguration _configuration;
        public DoctorDepartmentController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public IActionResult DoctorDepartmentList()
        {
            string ConnectionString = this._configuration.GetConnectionString(name: "MyConnectionString");
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();
            SqlCommand command = sqlConnection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_DoctorDepartment_SelectAll";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            return View(table);
        }

        //Delete method
        public IActionResult DoctorDepartmentDelete(int @DoctorDepartmentID)
        {
            string ConnectionString = this._configuration.GetConnectionString(name: "MyConnectionString");
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();

            SqlCommand command = sqlConnection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_DoctorDepartment_DeleteByPK";
            command.Parameters.Add("@DoctorDepartmentID", SqlDbType.Int).Value = @DoctorDepartmentID;
            command.ExecuteNonQuery();
            return RedirectToAction("DoctorDepartmentList");
        }

        public IActionResult DoctorDepartmentAddEdit()
        {
            return View();
        }
        public IActionResult DoctorDepartmentDetail()
        {
            return View();
        }

    }
}
