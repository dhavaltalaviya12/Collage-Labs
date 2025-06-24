using ASP_.NET_Lab.classes;
using static ASP_.NET_Lab.classes.InterfaceShape;

internal class Program
{
    private static void Main(string[] args)
    {
        //Program 1
        //try
        //{
        //    int a = 10;
        //    int b = 0;
        //    int ans = a / b;
        //}
        //catch (Exception e)
        //{
        //    Console.WriteLine(e.Message);
        //}

        //Program 2
        //try
        //{
        //    int[] n = new int[5];
        //    for (int i = 0; i < 6; i++) {
        //        Console.Write("Enter number "+i+":");
        //        n[i] = Convert.ToInt32(Console.ReadLine());
        //    }
        //    for (int i = 0; i < 5; i++) {
        //        Console.WriteLine(n[i]);
        //    }
        //}
        //catch (IndexOutOfRangeException e) { 
        //    Console.WriteLine(e.Message);
        //}

        //Program 3
        //Calculate calculate= new Calculate();
        //Console.WriteLine("a + b + c = "+ calculate.SumOfThree(10, 20, 30));
        //Console.WriteLine("a + b = "+ calculate.SumOfTwo(100, 200)); 

        //Program 4
        //InterfaceCalculate.Result result= new();
        //Console.WriteLine("a + b = "+result.Addition(10,20));
        //Console.WriteLine("a - b = " + result.Subtraction(50, 10));

        //Program 5
        //string str = "Dhaval Talaviya";
        //Console.WriteLine($"Original string: '{str}'");

        //string trimmed = str.Trim();
        //Console.WriteLine($"Trimmed: '{trimmed}'");

        //Console.WriteLine($"ToUpper: {trimmed.ToUpper()}");
        //Console.WriteLine($"ToLower: {trimmed.ToLower()}");

        //Console.WriteLine($"Substring (start at 7): {trimmed.Substring(7)}");

        //Console.WriteLine($"Replace 'Talaviya' with 'Patel': {trimmed.Replace("World", "C#")}");

        //Console.WriteLine($"Contains 'Hello': {trimmed.Contains("Hello")}");

        //Console.WriteLine($"IndexOf ' ': {trimmed.IndexOf(' ')}");

        //string[] parts = trimmed.Split(',');
        //Console.WriteLine("Split by ',' :");
        //foreach (var part in parts)
        //{
        //    Console.WriteLine(part);
        //}

        //Program 6
        //Console.WriteLine("Enter String : ");
        //string input = Console.ReadLine();
        //char[] swapped = new char[input.Length];

        //for (int i = 0; i < input.Length; i++)
        //{
        //    char c = input[i];
        //    if (char.IsLower(c))
        //        swapped[i] = char.ToUpper(c);
        //    else if (char.IsUpper(c))
        //        swapped[i] = char.ToLower(c);
        //    else
        //        swapped[i] = c;
        //}

        //string result = new string(swapped);
        //Console.WriteLine($"Swapped case: {result}");

        //Program 7
        AreaCalculator areaCalculator = new();
        Console.WriteLine("Circle area with r = 2 is " + areaCalculator.Circle(2));
        Console.WriteLine("Triangle area with base = 1, height = 3 is " + areaCalculator.Triangle(1, 3));
        Console.WriteLine("Square area with lenght = 2 is " + areaCalculator.Square(2));

    }
}