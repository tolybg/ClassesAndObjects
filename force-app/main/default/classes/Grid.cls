/*
    ### Grid 

    Create a class that tracks the position of a user in a 5x5 grid as x and y coordinates. The coordinates are index origin 0.
    The default position is the top left, but the user can specify the position in the constructor. 

    Create methods to move :

    1. left 
    1. right 
    1. up 
    1. down

    Any attempts to move outside of the grid, or establish a starting position outside the grid, should result in the x and y coordinates being set to the closest position that remains inside the grid.

    Create a method to output the grid to the debug log. Use the `-` character to represent empty space and the `*` character to represent the user’s current position. For example, if the user is currently at position 2,1 the following debug lines will be output:

    ```
    ----- 
    --*--
    -----
    -----
    -----
    ```
*/

public with sharing class Grid 
{
    //current position
    private Integer x;
    private Integer y; //should have been -y

    //Grid definition 5x5
    private Integer maxX = 5;
    private Integer maxY = 5;

    public Grid() 
    {
        this.x = 0;
        this.y = maxY;
    }

    public void moveDown()
    {
        if(y < maxY)
        {
            this.y++;
            System.Debug('OK, moved 1 down');
        }
        else
        {
            this.y = maxY;
            System.debug('Can\'t move any further');
        }
        showGrid();
    }

    public void moveUp()
    {
        if(y > 0)
        {
            this.y--;
            System.Debug('OK, moved 1 Up');
        }
        else
        {
            this.y = 0;
            System.debug('Can\'t move any further');
        }
        showGrid();
    }

    public void moveLeft()
    {
        if(x > 0)
        {
            this.x--;
            System.Debug('OK, moved 1 Left');
        }
        else
        {
            this.x = 0;
            System.debug('Can\'t move any further');
        }
        showGrid();
    }

    public void moveRight()
    {
        if(x < maxX)
        {
            this.x++;
            System.Debug('OK, moved 1 Right');
        }
        else
        {
            this.x = maxX;
            System.debug('Can\'t move any further');
        }
        showGrid();
    }

    public void showGrid()
    {
        String bitmap = 'You are here: \n';
        String pixel = '·';
        String cursor = '*';
        
        for (Integer j = 0; j <= maxY; j++) 
        {
            String hLine = '';

            for (Integer i = 0; i <= maxX; i++) 
            {
                if(i==this.x && j==this.y)
                {
                    hLine += cursor;
                }
                else
                {
                    hLine += pixel;
                }
            }
            hLine += '\n';
            bitmap += hLine;
        }
        System.Debug(bitmap);
    } 
}
