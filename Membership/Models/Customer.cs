using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Membership.Models
{
    public class Customer
    {
        public int Id { get; set; }
        public string Name { get; set; }    
        public int Visits { get; set; } 
        public DateTime LastVisit { get; set; }
        public Customer(int ID, string Name, int Visits, DateTime LastVisit) 
        { 
            Id = ID;    
            this.Name = Name;
            this.Visits = Visits;
            this.LastVisit = LastVisit; 
        }
    }
}