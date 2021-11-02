public with sharing class Author 
{
    public String FirstName;
    public String LastName;
    public String Email;
    public Map<String,Book> draftBooks  = new Map<String,Book>();
    public Map<Date,List<Book>> publishedBooks = new Map<Date,List<Book>>();

    //constructors
    public Author() 
    {
        this.FirstName = 'Anonymous';
        this.LastName = 'Author';
    }

    public Author(String firstName, String lastName) 
    {
        this.FirstName = firstName;
        this.LastName = lastName;
    }

    public Author(String firstName, String lastName, String email) 
    {
        this.FirstName = firstName;
        this.LastName = lastName;
        this.Email = email;
    }



    //methods
    public void newBook(String bookTitle, BookGenre genre, Integer pages)
    {
        Book b = new Book(bookTitle, genre, pages);
        this.draftBooks.put(bookTitle, b);
    }

    public void publishBook(String title)
    {
        Book b = draftBooks.get(title);

        if(b != null)
        {
            b.publishBook();
            List<Book> booksPublishedOnDate = publishedBooks.get(b.datePublished);
            if(booksPublishedOnDate == null){
                booksPublishedOnDate = new List<Book>();
            }
            booksPublishedOnDate.add(b);
            publishedBooks.put(b.datePublished, booksPublishedOnDate);
            draftBooks.remove(title);

            System.debug(LoggingLevel.ERROR, 'Published book: ' + title);
            System.debug(LoggingLevel.ERROR, JSON.serialize(b));
            System.debug(LoggingLevel.ERROR, 'draftBooks: ' + JSON.serialize(draftBooks));
            System.debug(LoggingLevel.ERROR, 'publishedBooks: ' + JSON.serialize(publishedBooks));
        }
        else
        {
            System.debug(LoggingLevel.ERROR, 'Cannot find this title, check spelling?  (' + title + ')');
        }
    }

    //inner class
    public class Book 
    {
        //TODO: lock after publishing
        public String title;
        public Integer nrPages;
        public BookGenre genre;

        public PublishedStatus status {get; private set;}
        public Date datePublished {get; private set;}

        public Book(String bookTitle, BookGenre bookGenre, Integer pages) 
        {
            this.Title = bookTitle;
            this.Genre = bookGenre;
            this.nrPages = pages;
            this.status = PublishedStatus.DRAFT;
        }

        public void publishBook()
        {
            if(this.Status != PublishedStatus.PUBLISHED)
            {
                this.Status = PublishedStatus.PUBLISHED;
                this.DatePublished = System.today();
            }
        }
    }

    //Enums
    public enum PublishedStatus {DRAFT, PUBLISHED}

}
