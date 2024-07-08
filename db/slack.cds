namespace app.slack;

entity Employees {
    key empID       : String(10);
        firstName   : String(20);
        lastName    : String(20);
        email       : String(60);
        designation : String(50);
        itequipment : String(50);
        amount : Integer;
}
