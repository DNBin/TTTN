using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.ViewModels
{
    public class MessageVM
    {
        public MessageVM()
        {
            MessageType = Messages.info;
        }
        public bool Status { get; set; }
        public string Message { get; set; }
        public Messages MessageType { get; set; }
        public dynamic Data { get; set; }

        
    }
    public enum Messages
    {
        warning,
        danger,
        success,
        info,
        error
    }
}