/*

### Circles

Create a class named `Circle` that encapsulates the radius of a circle.
It should be possible to construct a circle by providing either it’s radius or a string representation of its diameter.

Add methods to calculate and return :  
1. The circumference of the circle
1. The surface area of the circle

Any constants used in the calculation should be class variables and use the final keyword to prevent modification. They should not be visible or usable outside of the `Circle` class
*/

public with sharing class Circle {

    private Double Radius;
    private static final Double Pi = 3.14; // but should be Math.PI 

    public Circle(Double r) 
    {
        this.Radius = r;
    }

    public Circle(String diameterStr)
    {
        Double d = Double.valueOf(diameterStr);
        this.Radius = d / 2;
    }

    // The circumference of the circle
    public Double getCircumference()
    {
        return this.Radius * 2 * Circle.Pi;
    }

    // The surface area of the circle
    public Double getSurface()
    {
        //A = πr²
        return Circle.Pi * this.Radius * this.Radius;
    }
}
