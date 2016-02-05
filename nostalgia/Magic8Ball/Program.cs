using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Magic8Ball
{
    ////class Program2
    ////{
    ////    static string name = "Program2";
    ////    static public string alias = "That other program";
    ////    static int age = 0;
    ////    public static void Main2()
    ////    {

    //    }

    class Program
    {
        static void Main(string[] args)
        {

            Random sexyrandom = new Random();
            TellPeopleWhatProgramThisIs();
            

            while(true)
            {
                Console.ForegroundColor = ConsoleColor.White;
                Console.Write("Ask a question: ");
                Console.ForegroundColor = ConsoleColor.Red;
                string questionString = Console.ReadLine();

                System.Threading.Thread.Sleep(500);

                if(questionString.ToLower() == "quit")
                {
                    break;
                }

                if(questionString.Length == 0)
                {
                    Console.WriteLine("YOU FOOL. TYPE QUESTION NAO.");
                    continue;
                }

                if(questionString.ToLower() == "you suck")
                {
                    Console.WriteLine("So do you. Bye.");
                    break;
                }
                int randomNumber = sexyrandom.Next(4);

                switch(randomNumber)
                {
                    case 0:
                        {
                            Console.WriteLine("Yes!");
                            break;
                        }
                    case 1:
                        {
                            Console.WriteLine("No...");
                            break;
                        }
                    case 2:
                        {
                            Console.WriteLine("Heck yeah!");
                            break;
                        }
                    case 3:
                        {
                            Console.WriteLine("Sorry no.");
                            break;
                        }
                }
            }
            //Cleaning up
            Console.ForegroundColor = oldColor;
        }
        static void TellPeopleWhatProgramThisIs()
        {
            ConsoleColor oldColor = Console.ForegroundColor;
            Console.ForegroundColor = ConsoleColor.DarkYellow;
            Console.Write("M");
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine("agic 8 Ball (by: Ethan)");
        }

        public static ConsoleColor oldColor { get; set; }
    }
    
}
