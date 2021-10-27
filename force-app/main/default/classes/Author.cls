public with sharing class Author 
{
    public String FirstName;
    public String LastName;
    public String Email;
    public Map<String,Book> draftBooks  = new Map<String,Book>();
    public Map<Date,Book> publishedBooks = new Map<Date,Book>();

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
        draftBooks.put(bookTitle, b);
    }

    public void publishBook(String title)
    {
        Book b = draftBooks.get(title);
        b.publishBook();
        publishedBooks.put(b.datePublished, b);
        draftBooks.remove(title);

        System.debug(LoggingLevel.ERROR, 'Published book: ' + title);
        System.debug(LoggingLevel.ERROR, JSON.serialize(b));
        System.debug(LoggingLevel.ERROR, 'draftBooks: ' + JSON.serialize(draftBooks));
        System.debug(LoggingLevel.ERROR, 'publishedBooks: ' + JSON.serialize(publishedBooks));
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
        private Boolean isPublished = false;

        public Book(String bookTitle, BookGenre bookGenre, Integer pages) 
        {
            this.Title = bookTitle;
            this.Genre = bookGenre;
            this.nrPages = pages;
            this.status = PublishedStatus.DRAFT;
        }

        public void publishBook()
        {
            // Would this not be cleaner? 
            // if(isPublished) return;

            if(!isPublished)
            {
                this.Status = PublishedStatus.PUBLISHED;
                this.DatePublished = System.today();
                this.isPublished = true;
            }
            else
            {
                return;
            }
        }
    }

    //Enums
    public enum PublishedStatus {DRAFT, PUBLISHED}

    public enum BookGenre {                             //Big assumpiton is that the list is finite, but OTHER always helps
                            ACTION_AND_ADVENTURE, 
                            ANTHOLOGY,
                            BIOGRAPHY_AUTOBIOGRAPHY,
                            CLASSIC,
                            COMIC_AND_GRAPHIC_NOVEL,
                            CRIME_AND_DETECTIVE,
                            DRAMA,
                            ESSAY,
                            FABLE,
                            FAIRY_TALE,
                            FAN_FICTION,
                            FANTASY,
                            HISTORICAL_FICTION,
                            HORROR,
                            HUMOR,
                            LEGEND,
                            MAGICAL_REALISM,
                            MEMOIR,
                            MYSTERY,
                            MYTHOLOGY,
                            NARRATIVE_NONFICTION,
                            PERIODICALS,
                            POETRY,
                            REALISTIC_FICTION,
                            REFERENCE_BOOKS,
                            ROMANCE,
                            SATIRE,
                            SCIENCE_FICTION_SCI_FI,
                            SELF_HELP_BOOK,
                            SHORT_STORY,
                            SPEECH,
                            SUSPENSE_THRILLER,
                            TEXTBOOK,
                            OTHER}
}
