using System;using System.Collections;

void printHashTable(Hashtable hashtable)
{
    foreach (dynamic entry in hashtable)
    {
        Console.WriteLine($"{entry.Key}: {entry.Value}");
    }
}

void printDictionary(Dictionary<int, string> dictionary)
{
    foreach (var kv in dictionary)
    {
        Console.WriteLine($"{kv.Key}: {kv.Value}");
    }
}

while (true)
{
    Console.Write("\nEnter a program number: ");
    int n = int.Parse(Console.ReadLine());
    switch (n)
    {
        case 1:
            ArrayList studentNames = new ArrayList();
            studentNames.Add("Dhaval");
            studentNames.Add("Jevin");
            studentNames.Add("Yash");
            studentNames.Add("Niv");
            studentNames.Add(12);
            Console.WriteLine("Students after adding: " + string.Join(", ", studentNames.ToArray()));
            studentNames.RemoveAt(1);
            Console.WriteLine("Students after removing index 1: " + string.Join(", ", studentNames.ToArray()));
            studentNames.RemoveRange(0, 2);
            Console.WriteLine("Students after removing range(0,2): " + string.Join(", ", studentNames.ToArray()));
            studentNames.Clear();
            Console.WriteLine("Students after clearing: " + string.Join(", ", studentNames.ToArray()));
            break;


        case 2:
            List<string> studentList = new List<string>();
            studentList.Add("Dhaval");
            studentList.Add("Jevin");
            studentList.Add("Yash");
            Console.WriteLine("Students after adding: " + string.Join(", ", studentList));
            studentList.RemoveAt(0);
            Console.WriteLine("Students after removing index 0: " + string.Join(", ", studentList));
            studentList.RemoveRange(0, 1);
            Console.WriteLine("Students after removing range: " + string.Join(", ", studentList));
            studentList.Clear();
            Console.WriteLine("Students after clearing: " + string.Join(", ", studentList));
            break;


        case 3:
            Stack stack = new Stack();
            stack.Push(100);
            stack.Push(200);
            stack.Push(300);
            Console.WriteLine("Stack after pushing: " + string.Join(", ", stack.ToArray()));
            stack.Pop();
            Console.WriteLine("Stack after popping: " + string.Join(", ", stack.ToArray()));
            Console.WriteLine("Top item in stack: " + stack.Peek());
            Console.WriteLine("Does stack contain 20? " + stack.Contains(20));
            stack.Clear();
            Console.WriteLine("Stack after clearing: " + string.Join(", ", stack.ToArray()));
            break;


        case 4:
            Queue<int> queue = new Queue<int>();
            queue.Enqueue(10);
            queue.Enqueue(20);
            queue.Enqueue(30);
            Console.WriteLine("Queue after enqueueing: " + string.Join(", ", queue));
            queue.Dequeue();
            Console.WriteLine("Queue after dequeueing: " + string.Join(", ", queue));
            Console.WriteLine("Front item in queue: " + queue.Peek());
            Console.WriteLine("Does queue contain 20? " + queue.Contains(20));
            queue.Clear();
            Console.WriteLine("Queue after clearing: " + string.Join(", ", queue));
            break;

        /*
         * 5.	Create a Dictionary collection class object and preform following operations: 
             a.	Add: Adds a key-value pair. 
             b.	Remove: Removes a key-value pair by key. 
             c.	ContainsKey: Checks if a key exists in the hashtable. 
             d.	ContainsValue: Checks if a value exists in the hashtable. 
             e.	Clear: Removes all key-value pairs.
            */
        case 5:
            Dictionary<int, string> dictionary = new Dictionary<int, string>();
            dictionary.Add(1, "Dhaval");
            dictionary.Add(2, "Jevin");
            dictionary.Add(3, "Yash");
            Console.WriteLine("Dictionary after adding:");
            printDictionary(dictionary);
            dictionary.Remove(2);
            Console.WriteLine("\nDictionary after removing key 2:");
            printDictionary(dictionary);
            Console.WriteLine("\nDoes dictionary contain key 1? " + dictionary.ContainsKey(1));
            Console.WriteLine("Does dictionary contain value 'Yash'? " + dictionary.ContainsValue("Yash"));
            dictionary.Clear();
            Console.WriteLine("\nDictionary after clearing:");
            printDictionary(dictionary);
            break;


        /*
            6.	Create a Hashtable collection class object and preform following operations: 
                a.	Add: Adds a key-value pair. 
                b.	Remove: Removes a key-value pair by key. 
                c.	ContainsKey: Checks if a key exists in the hashtable. 
                d.	ContainsValue: Checks if a value exists in the hashtable. 
                e.	Clear: Removes all key-value pairs. 
         */

        case 6:
            Hashtable hashtable = new Hashtable();
            hashtable.Add("Name", "Dhaval");
            hashtable.Add("Age", 25);
            hashtable.Add("City", "Ahmedabad");
            Console.WriteLine("Hashtable after adding:");
            printHashTable(hashtable);
            hashtable.Remove("Age");
            Console.WriteLine("\nHashtable after removing key 'Age':");
            printHashTable(hashtable);
            Console.WriteLine("\nDoes hashtable contain key 'Name'? " + hashtable.ContainsKey("Name"));
            Console.WriteLine("Does hashtable contain value 'Ahmedabad'? " + hashtable.ContainsValue("Ahmedabad"));
            hashtable.Clear();
            Console.WriteLine("\nHashtable after clearing:");
            printHashTable(hashtable);
            break;




        default:
            Console.WriteLine("Invalid program number.");
            return 0;

    }
}