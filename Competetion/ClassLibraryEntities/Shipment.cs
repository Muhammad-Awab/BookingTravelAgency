namespace Competetion.ClassLibraryEntities
{
    public class Shipment
    {
        public int ShipmentID { get; set; }
        public string? Shipment_From { get; set; }
        public string? Shipment_To { get; set; }
        public string? Company_Name { get; set; }
        public int? Shipment_Weight { get; set; }
       
        public int UserID { get; set; }
        public bool ShipmentStatus { get; set; }

        public DateTime Shipment_Date { get; set; }
    }
}
