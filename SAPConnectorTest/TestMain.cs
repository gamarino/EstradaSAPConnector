using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SAPConnectorLibrary;

namespace SAPConnectorLibrary.Testing
{
    class TestMain
    {

        public static int Main(string[] args)
        {
            SAPConnectorLibrary.SynchToSAP ctx = new SynchToSAP();

            ctx.SynchNow();

            return 0;

        }
    }
}
