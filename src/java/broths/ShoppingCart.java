/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package broths;

import java.util.ArrayList;

/**
 *
 * @author vicda
 */
public class ShoppingCart {
    private float total;
    private int count;
    private ArrayList<Product> products;

    public ShoppingCart() {
        this.total = 0;
        this.count = 0;
        this.products = new ArrayList<Product>();
    }
    
    public void add(int id, int quantity, float price) {
        Product prod = new Product(id, quantity, price);
        if (!this.products.contains(prod)) {
            this.products.add(prod);
        } else {
            int index = this.products.indexOf(prod);
            Product tmp = this.products.get(index);
            tmp.setWanted(quantity + tmp.getWanted());
            this.products.set(index, tmp);
        }
        this.count += quantity;
        this.total += quantity * price;
    }
    
    public void remove(int id, int quantity) {
        Product prod = new Product(id, 0, 0);
        if (this.products.contains(prod)) {
            int index = this.products.indexOf(prod);
            Product tmp = this.products.get(index);
            tmp.setWanted(quantity - tmp.getWanted());
            if (tmp.getWanted() <= 0)
                this.products.remove(index);
            else
                this.products.set(index, tmp);
            this.total -= quantity * tmp.getPrice();
        }
        this.count -= quantity;
    }

    public float getTotal() {
        return total;
    }

    public int getCount() {
        return count;
    }
}
