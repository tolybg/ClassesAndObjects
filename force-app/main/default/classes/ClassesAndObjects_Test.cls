@IsTest

public with sharing class ClassesAndObjects_Test 
{

    @IsTest
    private static void testRectangle() 
    {
        Rectangle r = new Rectangle(2,4);
        System.AssertNotEquals(true, r.IsSquare(), 'This is not a square!');
        System.AssertEquals(8, r.GetSurface(), 'GetSurface doesn\'t calculate the area correctly!');
    }



    @IsTest
    private static void testCircle() 
    {
        Circle c = new Circle(6);
        System.AssertEquals(6 *2 * Math.PI, c.getCircumference(), 'Circumference didn\'t calculate correctly');
        System.AssertEquals(113.04, Math.roundToLong(c.GetSurface()), 'GetSurface doesn\'t calculate the area correctly!');
    }
    
    @IsTest
    private static void testGrid()
    {
        Grid g = new Grid();
        g.moveDown();
        g.moveLeft();
        g.moveUp();
        g.moveUp();
        g.moveLeft();
        g.moveLeft();
        g.moveUp();
        g.moveUp();
        g.moveUp();
        //can't go any further!
        g.moveUp();

        //TODO: test location with @isTestVisible
    }

    @IsTest
    private static void testBooks()
    {
        Author w = new Author('John', 'Doe');
        // Author.Book b = new Author.Book('Memoir', Author.BookGenre.BIOGRAPHY_AUTOBIOGRAPHY, 10);
        w.newBook('Memoir', BookGenre.BIOGRAPHY_AUTOBIOGRAPHY, 10);
        w.publishBook('Memoir');

        Author.Book publishedBook = w.publishedBooks.values()[0][0];

        System.assertEquals(publishedBook.status, Author.PublishedStatus.PUBLISHED, 'Book didn\'t change publish status!'  );
    }
}
