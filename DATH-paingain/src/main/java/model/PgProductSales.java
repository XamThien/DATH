package model;
// Generated Jun 19, 2018 9:42:26 PM by Hibernate Tools 4.3.5.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * PgProductSales generated by hbm2java
 */
@Entity
@Table(name = "pg_product_sales", catalog = "dath")
public class PgProductSales implements java.io.Serializable {

	private Integer saleId;
	private PgProducts pgProducts;
	private Date startDate;
	private Date endDate;
	private int saleValue;
	private Boolean isPercent;
	private Integer salesStatus;

	public PgProductSales() {
	}

	public PgProductSales(PgProducts pgProducts, Date startDate, Date endDate, int saleValue) {
		this.pgProducts = pgProducts;
		this.startDate = startDate;
		this.endDate = endDate;
		this.saleValue = saleValue;
	}

	public PgProductSales(PgProducts pgProducts, Date startDate, Date endDate, int saleValue, Boolean isPercent,
			Integer salesStatus) {
		this.pgProducts = pgProducts;
		this.startDate = startDate;
		this.endDate = endDate;
		this.saleValue = saleValue;
		this.isPercent = isPercent;
		this.salesStatus = salesStatus;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "SALE_ID", unique = true, nullable = false)
	public Integer getSaleId() {
		return this.saleId;
	}

	public void setSaleId(Integer saleId) {
		this.saleId = saleId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PRODUCT_ID", nullable = false)
	public PgProducts getPgProducts() {
		return this.pgProducts;
	}

	public void setPgProducts(PgProducts pgProducts) {
		this.pgProducts = pgProducts;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "START_DATE", nullable = false, length = 19)
	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "END_DATE", nullable = false, length = 19)
	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Column(name = "SALE_VALUE", nullable = false)
	public int getSaleValue() {
		return this.saleValue;
	}

	public void setSaleValue(int saleValue) {
		this.saleValue = saleValue;
	}

	@Column(name = "IS_PERCENT")
	public Boolean getIsPercent() {
		return this.isPercent;
	}

	public void setIsPercent(Boolean isPercent) {
		this.isPercent = isPercent;
	}

	@Column(name = "SALES_STATUS")
	public Integer getSalesStatus() {
		return this.salesStatus;
	}

	public void setSalesStatus(Integer salesStatus) {
		this.salesStatus = salesStatus;
	}

}
