/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author dangt
 */
public class Cart extends PgOrders {

    public boolean isDuplicate(PgOrderDetails order) {
        return this.getPgOrderDetailses().contains(order);
    }

    public void addToCart(PgOrderDetails order) {
        if (!isDuplicate(order)) {
            this.getPgOrderDetailses().add(order);
        } else {
            if (order.getAmount() >= 1) {
                this.getPgOrderDetailses().remove(order);
                this.getPgOrderDetailses().add(order);
            } else if (order.getAmount() == 0) {
                removeFromCart(order);
            }
        }
    }

    public boolean removeFromCart(PgOrderDetails order) {
        if (isDuplicate(order)) {
            this.getPgOrderDetailses().remove(order);
            return true;
        }
        return false;
    }
}
