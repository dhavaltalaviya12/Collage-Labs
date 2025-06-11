using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_.NET_Labs
{
    internal class Candidates
    {
        int id;
        string Name;
        int Age;
        int Weight;
        float Height;

        public void GetCandidateDetails()
        {
            Console.WriteLine("Enter Candidate ID : ");
            id = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Candidate Name : ");
            Name = Console.ReadLine();
            Console.WriteLine("Enter Candidate Age : ");
            Age = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Candidate Weight : ");
            Weight = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Candidate Height : ");
            Height = (float)Convert.ToDouble(Console.ReadLine());
        }

        public void DisplayCandidateDetails()
        {
            Console.WriteLine("Candidate Id is "+id);
            Console.WriteLine("Candidate Name is " + Name);
            Console.WriteLine("Candidate Age is " + Age);
            Console.WriteLine("Candidate Weight is " + Weight);
            Console.WriteLine("Candidate Height is " + Height);
        }
    }
}
