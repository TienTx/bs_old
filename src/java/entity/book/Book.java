/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.book;

import java.io.Serializable;
<<<<<<< HEAD
import tool.MyTool;
=======
import java.util.ArrayList;
>>>>>>> 8e68ce0065eebbd484aaa4115bba4754f3c1b032

/**
 *
 * @author txtd1
 */
public class Book implements Serializable {

    private int idBook;
    private String image;
    private String title;
    private String author;
    private String publisher;
    private String publishYear;
    private String description;
    private String originalPrice;
    private String salePrice;
    private int quantity;
    private Category category;
    private BookSet set;
    private String sortLink;
    private int votes;
    private float ratePoint;
    private ArrayList<Deals> listDeals;

    public Book() {
    }

    public void setIdBook(int idBook) {
        this.idBook = idBook;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public void setPublishYear(String publishYear) {
        this.publishYear = publishYear;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setOriginalPrice(String originalPrice) {
        this.originalPrice = originalPrice;
    }

    public void setSalePrice(String salePrice) {
        this.salePrice = salePrice;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public void setSet(BookSet set) {
        this.set = set;
    }

    public void setSortLink(String sortLink) {
        this.sortLink = sortLink;
    }

    public void setVotes(int votes) {
        this.votes = votes;
    }

    public void setRatePoint(float ratePoint) {
        this.ratePoint = ratePoint;
    }

    public void setListDeals(ArrayList<Deals> listDeals) {
        this.listDeals = listDeals;
    }

    public int getIdBook() {
        return idBook;
    }

    public String getImage() {
        return image;
    }

    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public String getPublisher() {
        return publisher;
    }

    public String getPublishYear() {
        return publishYear;
    }

    public String getDescription() {
        return description;
    }

    public String getOriginalPrice() {
        return originalPrice;
    }

    public String getSalePrice() {
        return salePrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public Category getCategory() {
        return category;
    }

    public BookSet getSet() {
        return set;
    }

    public String getSortLink() {
        return sortLink;
    }

    public int getVotes() {
        return votes;
    }

    public float getRatePoint() {
        return ratePoint;
    }

    public ArrayList<Deals> getListDeals() {
        return listDeals;
    }

    public Book(String image, String title, String author, String publisher, String publishYear, String description, String originalPrice, String salePrice, int quantity, Category category, BookSet set, String sortLink, int votes, float ratePoint, ArrayList<Deals> listDeals) {
        this.image = image;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.publishYear = publishYear;
        this.description = description;
        this.originalPrice = originalPrice;
        this.salePrice = salePrice;
        this.quantity = quantity;
        this.category = category;
        this.set = set;
        this.sortLink = sortLink;
        this.votes = votes;
        this.ratePoint = ratePoint;
        this.listDeals = listDeals;
    }

    public Book(int idBook, String image, String title, String author, String publisher, String publishYear, String description, String originalPrice, String salePrice, int quantity, Category category, BookSet set, String sortLink, int votes, float ratePoint, ArrayList<Deals> listDeals) {
        this.idBook = idBook;
        this.image = image;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.publishYear = publishYear;
        this.description = description;
        this.originalPrice = originalPrice;
        this.salePrice = salePrice;
        this.quantity = quantity;
        this.category = category;
        this.set = set;
        this.sortLink = sortLink;
        this.votes = votes;
        this.ratePoint = ratePoint;
        this.listDeals = listDeals;
    }
    public Book convertBook(Object book){
        if(book instanceof NXBHaNoi.Book){
            NXBHaNoi.Book bookHN = (NXBHaNoi.Book) book;
            Book bookConvert = new Book();
            bookConvert.setIdBook(bookHN.getIdBook());
            bookConvert.setImage(bookHN.getImage());
            bookConvert.setTitle(bookHN.getTitle());
            bookConvert.setAuthor(bookHN.getAuthor());
            bookConvert.setPublisher(bookHN.getPublisher());
            bookConvert.setPublishYear(bookHN.getPublishYear() + "");
            bookConvert.setDescription(bookHN.getDescription());
            bookConvert.setOriginalPrice(bookHN.getOriginalPrice() + "");
            bookConvert.setSalePrice(bookHN.getSalePrice() + "");
            bookConvert.setQuantity(bookHN.getQuantity());
            bookConvert.setSortLink(new MyTool().convertString(bookHN.getPublisher()));
            
            Category category = new Category();
            NXBHaNoi.Category catHN = bookHN.getCategory();
            category.setIdCategory(catHN.getIdCategory());
            category.setName(catHN.getName());
            category.setDescription(catHN.getDescription());
            bookConvert.setCategory(category);
            
            BookSet bookSet=new BookSet();
            NXBHaNoi.BookSet bsHN = bookHN.getBookSet();
            bookSet.setIdBookSet(bsHN.getIdBookSet());
            bookSet.setName(bsHN.getName());
            bookSet.setDescription(bsHN.getDescription());
            bookConvert.setSet(bookSet);
            return bookConvert;
        }else{
            NXBDaNang.Book bookDN = (NXBDaNang.Book) book;
            Book bookConvert = new Book();
            bookConvert.setIdBook(bookDN.getIdBook());
            bookConvert.setImage(bookDN.getImage());
            bookConvert.setTitle(bookDN.getTitle());
            bookConvert.setAuthor(bookDN.getAuthor());
            bookConvert.setPublisher(bookDN.getPublisher());
            bookConvert.setPublishYear(bookDN.getPublishYear() + "");
            bookConvert.setDescription(bookDN.getDescription());
            bookConvert.setOriginalPrice(bookDN.getOriginalPrice() + "");
            bookConvert.setSalePrice(bookDN.getSalePrice() + "");
            bookConvert.setQuantity(bookDN.getQuantity());
            bookConvert.setSortLink(new MyTool().convertString(bookDN.getPublisher()));
            
            Category category = new Category();
            NXBDaNang.Category catDN = bookDN.getCategory();
            category.setIdCategory(catDN.getIdCategory());
            category.setName(catDN.getName());
            category.setDescription(catDN.getDescription());
            bookConvert.setCategory(category);
            
            BookSet bookSet=new BookSet();
            NXBDaNang.BookSet bsDN = bookDN.getBookSet();
            bookSet.setIdBookSet(bsDN.getIdBookSet());
            bookSet.setName(bsDN.getName());
            bookSet.setDescription(bsDN.getDescription());
            bookConvert.setSet(bookSet);
            return bookConvert;
        }
    }
}
