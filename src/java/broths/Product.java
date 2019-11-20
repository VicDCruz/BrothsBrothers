/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package broths;

/**
 *
 * @author vicda
 */
public class Product {

    private int id;
    private int wanted;

    public Product(int id, int wanted) {
        this.id = id;
        this.wanted = wanted;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getWanted() {
        return wanted;
    }

    public void setWanted(int wanted) {
        this.wanted = wanted;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Product other = (Product) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

}
