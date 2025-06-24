using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_.NET_Lab.classes
{
    internal class Calculate : Sum
    {
        public override int SumOfThree(int a, int b, int c)
        {
            return a + b + c;
        }

        public override int SumOfTwo(int a, int b)
        {
            return a + b;
        }
    }
}
