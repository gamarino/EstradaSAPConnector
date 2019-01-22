using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SAPConnectorLibrary;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            SAPConnectorLibrary.SynchToSAP testLib = new SAPConnectorLibrary.SynchToSAP;

            testLib.SynchNow();

        }
    }
}
