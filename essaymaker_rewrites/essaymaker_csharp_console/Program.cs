using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Threading;
using System.Windows.Forms;

namespace ConsoleApplication4
{
    class Variables
    {
        public static string topicSentence;
        public static string eviDence;
        public static string CONclusion;
    }
    public class Program
    {
        [STAThread]
        static void Main(string[] arg)
        {
                
            
            ConsoleColor backColor = Console.BackgroundColor;
            ConsoleColor foreColor = Console.ForegroundColor;
            
            Console.WriteLine("Welcome to Essay Maker 2.0.");
            Console.WriteLine("This has been programmed in C# for the RRMS Science Fair.");
            Console.WriteLine("by Ethan Arterberry");
            Thread.Sleep(5000);
            Console.Clear();
            File.WriteAllText(@"C:\Temp\WriteLines.txt", String.Empty);
            TopicSentence();


        }

        public static void TopicSentence()
        {
            
            Console.WriteLine("Please write your topic sentence: ");
            string topicSentence = Console.ReadLine();
            Console.WriteLine("Your topic sentence is: {0}", topicSentence);
            using (System.IO.StreamWriter file = new System.IO.StreamWriter(@"C:\Temp\WriteLines.txt", true))
            {
                file.WriteLine(topicSentence);
            }
            Console.WriteLine("Is this what you want? [a] for yes and [b] for no.");
            ConsoleKeyInfo yesnoTopic = Console.ReadKey();
            if (yesnoTopic.KeyChar == 'b')
            {
                Console.Clear();
                TopicSentence();
            }
            
            if (yesnoTopic.KeyChar == 'a')
            {
                Console.Clear();
                Evidence();
            }

            else
            {
                Console.WriteLine("You did not say choose any of the right keys. Please choose again.");
                ConsoleKeyInfo yesnoTopic2 = Console.ReadKey();
                if (yesnoTopic2.KeyChar == 'b')
                {
                    Console.Clear();
                    TopicSentence();
                }
                if (yesnoTopic2.KeyChar == 'a')
                {
                    Console.Clear();
                    Evidence();
                }

            }
            
         }

            public static void Evidence()
            {
                Console.WriteLine("Please write your evidence: ");
                string eviDence = Console.ReadLine();
                Console.WriteLine("Your evidence is: {0}", eviDence);
                using (System.IO.StreamWriter file = new System.IO.StreamWriter(@"C:\Temp\WriteLines.txt", true))
                {
                    file.WriteLine(eviDence);
                }
                Console.WriteLine("Is this what you want? [a] for yes and [b] for no.");
                ConsoleKeyInfo yesnoEvidence = Console.ReadKey();
                if (yesnoEvidence.KeyChar == 'b')
                {
                    Console.Clear();
                    Evidence();
                }

                if (yesnoEvidence.KeyChar == 'a')
                {
                    Console.Clear();
                    Conclusion();
                }

                else
                {
                    Console.WriteLine("You did not say choose any of the right keys. Please choose again.");
                    ConsoleKeyInfo yesnoEvidence2 = Console.ReadKey();
                    if (yesnoEvidence2.KeyChar == 'b')
                    {
                        Console.Clear();
                        Evidence();
                    }
                    if (yesnoEvidence2.KeyChar == 'a')
                    {
                        Console.Clear();
                        Conclusion();
                    }
                }    
                    

              
            }

            public static void Conclusion()
            {
                Console.WriteLine("Please write your conclusion: ");
                string CONclusion = Console.ReadLine();
                Console.WriteLine("Your conclusion is: {0}", CONclusion);
                using (System.IO.StreamWriter file = new System.IO.StreamWriter(@"C:\Temp\WriteLines.txt", true))
                {
                    file.WriteLine(CONclusion);
                }
                Console.WriteLine("Is this what you want? [a] for yes and [b] for no.");
                ConsoleKeyInfo yesnoConclusion = Console.ReadKey();
                if (yesnoConclusion.KeyChar == 'b')
                {
                    Console.Clear();
                    Conclusion();
                }

                if (yesnoConclusion.KeyChar == 'a')
                {
                    Console.Clear();
                    WriteToFile();
                }

                else
                {
                    Console.WriteLine("You did not say choose any of the right keys. Please choose again.");
                    ConsoleKeyInfo yesnoConclusion2 = Console.ReadKey();
                    if (yesnoConclusion2.KeyChar == 'b')
                    {
                        Console.Clear();
                        Conclusion();
                    }
                    if (yesnoConclusion2.KeyChar == 'a')
                    {
                        Console.Clear();
                        WriteToFile();
                    }
                }
                
            }
            public static void WriteToFile()
            {
                string path = @"c:\temp\WriteLines.txt";
                using (StreamReader sr = File.OpenText(path))
                {
                    string s = "";
                    while ((s = sr.ReadLine()) != null)
                    {
                        Console.WriteLine(s);
                    }
                    
                }
                Console.WriteLine (@"Your text has been copied to the clipboard. Please restart before using again.");
                string awesomeness = System.IO.File.ReadAllText(@"C:\Temp\WriteLines.txt");
                Clipboard.Clear();
                Clipboard.SetText(awesomeness);
            }
            
            
            
    }

        
}
