package model;
// Generated Jun 20, 2018 4:50:52 PM by Hibernate Tools 4.3.5.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * PgProducts generated by hbm2java
 */
@Entity
@Table(name = "pg_products", catalog = "dath")
public class PgProducts implements java.io.Serializable {

	private Integer productId;
	private PgCategories pgCategories;
	private PgSuppliers pgSuppliers;
	private String productName;
	private int quantity;
	private int unitPrice;
	private int unitOrder;
	private String description;
	private int productStatus;
	private Date createTime;
	private Date modifiedTime;
	private Boolean isNew;
	private Boolean isHot;
	private Set<PgProductSales> pgProductSaleses = new HashSet<PgProductSales>();
	private Set<PgOrderDetails> pgOrderDetailses = new HashSet<PgOrderDetails>();
	private Set<PgProductPictures> pgProductPictureses = new HashSet<PgProductPictures>();

	public PgProducts() {
	}

	public PgProducts(PgCategories pgCategories, PgSuppliers pgSuppliers, String productName, int quantity,
			int unitPrice, int unitOrder,String mota,Date createTime,Date modifiedTime, Boolean isHot,Boolean isNew) {
		this.pgCategories = pgCategories;
		this.pgSuppliers = pgSuppliers;
		this.productName = productName;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.unitOrder = unitOrder;
		this.description = mota;
		this.createTime = createTime;
		this.modifiedTime = modifiedTime;
		this.isHot = isHot;
		this.isNew= isNew;
		this.productStatus =1;
	}
	public PgProducts(int id)
	{
		this.productId = id;
	}
	public PgProducts(PgCategories pgCategories, PgSuppliers pgSuppliers, String productName, int quantity,
			int unitPrice, int unitOrder, String description, int productStatus, Date createTime, Date modifiedTime,
			Boolean isNew, Boolean isHot, Set<PgProductSales> pgProductSaleses, Set<PgOrderDetails> pgOrderDetailses,
			Set<PgProductPictures> pgProductPictureses) {
		this.pgCategories = pgCategories;
		this.pgSuppliers = pgSuppliers;
		this.productName = productName;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.unitOrder = unitOrder;
		this.description = description;
		this.productStatus = productStatus;
		this.createTime = createTime;
		this.modifiedTime = modifiedTime;
		this.isNew = isNew;
		this.isHot = isHot;
		this.pgProductSaleses = pgProductSaleses;
		this.pgOrderDetailses = pgOrderDetailses;
		this.pgProductPictureses = pgProductPictureses;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "PRODUCT_ID", unique = true, nullable = false)
	public Integer getProductId() {
		return this.productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CATEGORY_ID", nullable = false)
	public PgCategories getPgCategories() {
		return this.pgCategories;
	}

	public void setPgCategories(PgCategories pgCategories) {
		this.pgCategories = pgCategories;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SUPPLIER_ID", nullable = false)
	public PgSuppliers getPgSuppliers() {
		return this.pgSuppliers;
	}

	public void setPgSuppliers(PgSuppliers pgSuppliers) {
		this.pgSuppliers = pgSuppliers;
	}

	@Column(name = "PRODUCT_NAME", nullable = false, length = 100)
	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Column(name = "QUANTITY", nullable = false)
	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Column(name = "UNIT_PRICE", nullable = false)
	public int getUnitPrice() {
		return this.unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	@Column(name = "UNIT_ORDER", nullable = false)
	public int getUnitOrder() {
		return this.unitOrder;
	}

	public void setUnitOrder(int unitOrder) {
		this.unitOrder = unitOrder;
	}

	@Column(name = "DESCRIPTION", length = 300)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "PRODUCT_STATUS", nullable = false)
	public int getProductStatus() {
		return this.productStatus;
	}

	public void setProductStatus(int productStatus) {
		this.productStatus = productStatus;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_TIME", length = 19)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "MODIFIED_TIME", length = 19)
	public Date getModifiedTime() {
		return this.modifiedTime;
	}

	public void setModifiedTime(Date modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

	@Column(name = "IS_NEW")
	public Boolean getIsNew() {
		return this.isNew;
	}

	public void setIsNew(Boolean isNew) {
		this.isNew = isNew;
	}

	@Column(name = "IS_HOT")
	public Boolean getIsHot() {
		return this.isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pgProducts")
	public Set<PgProductSales> getPgProductSaleses() {
		return this.pgProductSaleses;
	}

	public void setPgProductSaleses(Set<PgProductSales> pgProductSaleses) {
		this.pgProductSaleses = pgProductSaleses;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pgProducts")
	public Set<PgOrderDetails> getPgOrderDetailses() {
		return this.pgOrderDetailses;
	}

	public void setPgOrderDetailses(Set<PgOrderDetails> pgOrderDetailses) {
		this.pgOrderDetailses = pgOrderDetailses;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pgProducts")
	public Set<PgProductPictures> getPgProductPictureses() {
		return this.pgProductPictureses;
	}

	public void setPgProductPictureses(Set<PgProductPictures> pgProductPictureses) {
		this.pgProductPictureses = pgProductPictureses;
	}

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof PgProducts){
            return this.productId == ((PgProducts)obj).getProductId();
        }
        return false;
    }

    @Override
    public int hashCode() {
        return productId; //To change body of generated methods, choose Tools | Templates.
    }
    
}
