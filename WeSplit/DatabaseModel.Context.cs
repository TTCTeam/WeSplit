﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WeSplit
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class WeSplitEntities : DbContext
    {
        public WeSplitEntities()
            : base("name=WeSplitEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Image> Images { get; set; }
        public virtual DbSet<Member> Members { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<StatusDescription> StatusDescriptions { get; set; }
        public virtual DbSet<Trip> Trips { get; set; }
        public virtual DbSet<Waypoint> Waypoints { get; set; }
    }
}
