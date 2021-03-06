package models;

public class House extends Facility {
    private String typeHouse;
    private int floors;

    public House() {
    }

    public House(String idFacility,
                 String nameService,
                 double usableArea,
                 double rentalCosts,
                 int maximumNumberOfPeople,
                 String rentalType,
                 String typeHouse,
                 int floors) {
        super(idFacility, nameService, usableArea, rentalCosts, maximumNumberOfPeople, rentalType);
        this.typeHouse = typeHouse;
        this.floors = floors;
    }

    @Override
    public String getInfo() {
        return String.format("%s,%s,%s,%s,%s,%s,%s,%s",
                super.getIdFacility(),
                super.getNameService(),
                super.getUsableArea(),
                super.getRentalCosts(),
                super.getMaximumNumberOfPeople(),
                super.getRentalType(),
                this.typeHouse,
                this.floors + "\n");
    }

    public String getTypeHouse() {
        return typeHouse;
    }

    public void setTypeHouse(String typeHouse) {
        this.typeHouse = typeHouse;
    }

    public int getFloors() {
        return floors;
    }

    public void setFloors(int floors) {
        this.floors = floors;
    }

    @Override
    public String toString() {
        return "House{" + super.toString() +
                "typeHouse='" + typeHouse + '\'' +
                ", soTang=" + floors +
                '}';
    }
}
