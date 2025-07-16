using HMS.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;

namespace HMS.Controllers
{
    public class UserController : Controller
    {
        #region configuration
        private IConfiguration _configuration;
        public UserController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        #endregion


        public IActionResult UserList()
        {
            string ConnectionString = this._configuration.GetConnectionString(name: "MyConnectionString");
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();
            SqlCommand command = sqlConnection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_User_SelectAll";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            return View(table);
        }

        //Delete method
        public IActionResult UserDelete(int @UserID)
        {
            string ConnectionString = this._configuration.GetConnectionString(name: "MyConnectionString");
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();

            SqlCommand command = sqlConnection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_User_DeleteByPK";
            command.Parameters.Add("@UserID", SqlDbType.Int).Value = @UserID;
            command.ExecuteNonQuery();
            return RedirectToAction("UserList");
        }

        public IActionResult UserAddEdit(UserModel userModel)
        {
            if (ModelState.IsValid)
            {
                string ConnectionString = this._configuration.GetConnectionString(name: "MyConnectionString");
                SqlConnection sqlConnection = new SqlConnection(ConnectionString);
                sqlConnection.Open();
                SqlCommand command = sqlConnection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_User_Insert";
                //command.Parameters.Add("@UserID", SqlDbType.Int).Value = userModel.UserId;
                command.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = userModel.UserName;
                command.Parameters.Add("@Password", SqlDbType.NVarChar).Value = userModel.Password;
                command.Parameters.Add("@Email", SqlDbType.NVarChar).Value = userModel.Email;
                command.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = userModel.MobileNo;
                command.Parameters.Add("@IsActive", SqlDbType.Bit).Value = userModel.IsActive;
                //command.Parameters.Add("@Created", SqlDbType.DateTime).Value = userModel.Created;
                //command.Parameters.Add("@Modified", SqlDbType.DateTime).Value = userModel.Modified;
                command.ExecuteNonQuery();

                return RedirectToAction("UserList");
                TempData["Messege"] = "User Inserted Successfully!";
            }
            
                return View("UserAddEdit", userModel);
        }
        public IActionResult UserDetail()
        {
            return View();
        }
    }
}
