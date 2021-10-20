/*
### Rectangles

Create a class named `Rectangle` that encapsulates the height and width of a rectangle.
It should only be possible to construct a rectangle by supplying a height and width - no defaults are provided.

Add methods to :
1. Calculate and return the surface area of the rectangle
1. Determine if the rectangle is a square, returning true if it is, otherwise false
*/

public with sharing class Rectangle 
{
    private Integer Height;
    private Integer Width;

    public Rectangle(Integer h, Integer w) 
    {
        this.Height = h;
        this.Width = w;
    }

    public Integer GetSurface()
    {
        return  this.Height * this.Width;
    }

    public Boolean IsSquare()
    {
        return this.Height == this.Width;
    }
}
