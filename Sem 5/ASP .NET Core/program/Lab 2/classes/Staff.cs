using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Channels;
using System.Threading.Tasks;

namespace ASP_.NET_Labs.Lab_2
{
    internal class Staff
    {
        public string Name;
        public string Department;
        string Designation;
        int Experience;
        public int Salary;

        public void GetStaffDetails()
        {
            Console.WriteLine("Enter Staff Name : ");
            Name = Console.ReadLine();
            Console.WriteLine("Enter Staff Department : ");
            Department = Console.ReadLine();
            Console.WriteLine("Enter Staff Designation : ");
            Designation = Console.ReadLine();
            Console.WriteLine("Enter Staff Experience : ");
            Experience = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Staff Salary : ");
            Salary = Convert.ToInt32(Console.ReadLine());
        }
    }
}
