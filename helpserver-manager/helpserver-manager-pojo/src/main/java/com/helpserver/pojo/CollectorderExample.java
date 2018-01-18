package com.helpserver.pojo;

import java.util.ArrayList;
import java.util.List;

public class CollectorderExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public CollectorderExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo=pageNo;
        this.startRow = (pageNo-1)*this.pageSize;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setStartRow(Integer startRow) {
        this.startRow=startRow;
    }

    public Integer getStartRow() {
        return startRow;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize=pageSize;
        this.startRow = (pageNo-1)*this.pageSize;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setFields(String fields) {
        this.fields=fields;
    }

    public String getFields() {
        return fields;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andCollectidIsNull() {
            addCriterion("collectId is null");
            return (Criteria) this;
        }

        public Criteria andCollectidIsNotNull() {
            addCriterion("collectId is not null");
            return (Criteria) this;
        }

        public Criteria andCollectidEqualTo(Integer value) {
            addCriterion("collectId =", value, "collectid");
            return (Criteria) this;
        }

        public Criteria andCollectidNotEqualTo(Integer value) {
            addCriterion("collectId <>", value, "collectid");
            return (Criteria) this;
        }

        public Criteria andCollectidGreaterThan(Integer value) {
            addCriterion("collectId >", value, "collectid");
            return (Criteria) this;
        }

        public Criteria andCollectidGreaterThanOrEqualTo(Integer value) {
            addCriterion("collectId >=", value, "collectid");
            return (Criteria) this;
        }

        public Criteria andCollectidLessThan(Integer value) {
            addCriterion("collectId <", value, "collectid");
            return (Criteria) this;
        }

        public Criteria andCollectidLessThanOrEqualTo(Integer value) {
            addCriterion("collectId <=", value, "collectid");
            return (Criteria) this;
        }

        public Criteria andCollectidIn(List<Integer> values) {
            addCriterion("collectId in", values, "collectid");
            return (Criteria) this;
        }

        public Criteria andCollectidNotIn(List<Integer> values) {
            addCriterion("collectId not in", values, "collectid");
            return (Criteria) this;
        }

        public Criteria andCollectidBetween(Integer value1, Integer value2) {
            addCriterion("collectId between", value1, value2, "collectid");
            return (Criteria) this;
        }

        public Criteria andCollectidNotBetween(Integer value1, Integer value2) {
            addCriterion("collectId not between", value1, value2, "collectid");
            return (Criteria) this;
        }

        public Criteria andOrderidIsNull() {
            addCriterion("orderId is null");
            return (Criteria) this;
        }

        public Criteria andOrderidIsNotNull() {
            addCriterion("orderId is not null");
            return (Criteria) this;
        }

        public Criteria andOrderidEqualTo(Integer value) {
            addCriterion("orderId =", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotEqualTo(Integer value) {
            addCriterion("orderId <>", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidGreaterThan(Integer value) {
            addCriterion("orderId >", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidGreaterThanOrEqualTo(Integer value) {
            addCriterion("orderId >=", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidLessThan(Integer value) {
            addCriterion("orderId <", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidLessThanOrEqualTo(Integer value) {
            addCriterion("orderId <=", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidIn(List<Integer> values) {
            addCriterion("orderId in", values, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotIn(List<Integer> values) {
            addCriterion("orderId not in", values, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidBetween(Integer value1, Integer value2) {
            addCriterion("orderId between", value1, value2, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotBetween(Integer value1, Integer value2) {
            addCriterion("orderId not between", value1, value2, "orderid");
            return (Criteria) this;
        }

        public Criteria andCollectoridIsNull() {
            addCriterion("collectorId is null");
            return (Criteria) this;
        }

        public Criteria andCollectoridIsNotNull() {
            addCriterion("collectorId is not null");
            return (Criteria) this;
        }

        public Criteria andCollectoridEqualTo(Integer value) {
            addCriterion("collectorId =", value, "collectorid");
            return (Criteria) this;
        }

        public Criteria andCollectoridNotEqualTo(Integer value) {
            addCriterion("collectorId <>", value, "collectorid");
            return (Criteria) this;
        }

        public Criteria andCollectoridGreaterThan(Integer value) {
            addCriterion("collectorId >", value, "collectorid");
            return (Criteria) this;
        }

        public Criteria andCollectoridGreaterThanOrEqualTo(Integer value) {
            addCriterion("collectorId >=", value, "collectorid");
            return (Criteria) this;
        }

        public Criteria andCollectoridLessThan(Integer value) {
            addCriterion("collectorId <", value, "collectorid");
            return (Criteria) this;
        }

        public Criteria andCollectoridLessThanOrEqualTo(Integer value) {
            addCriterion("collectorId <=", value, "collectorid");
            return (Criteria) this;
        }

        public Criteria andCollectoridIn(List<Integer> values) {
            addCriterion("collectorId in", values, "collectorid");
            return (Criteria) this;
        }

        public Criteria andCollectoridNotIn(List<Integer> values) {
            addCriterion("collectorId not in", values, "collectorid");
            return (Criteria) this;
        }

        public Criteria andCollectoridBetween(Integer value1, Integer value2) {
            addCriterion("collectorId between", value1, value2, "collectorid");
            return (Criteria) this;
        }

        public Criteria andCollectoridNotBetween(Integer value1, Integer value2) {
            addCriterion("collectorId not between", value1, value2, "collectorid");
            return (Criteria) this;
        }

        public Criteria andCollecttimeIsNull() {
            addCriterion("collectTime is null");
            return (Criteria) this;
        }

        public Criteria andCollecttimeIsNotNull() {
            addCriterion("collectTime is not null");
            return (Criteria) this;
        }

        public Criteria andCollecttimeEqualTo(String value) {
            addCriterion("collectTime =", value, "collecttime");
            return (Criteria) this;
        }

        public Criteria andCollecttimeNotEqualTo(String value) {
            addCriterion("collectTime <>", value, "collecttime");
            return (Criteria) this;
        }

        public Criteria andCollecttimeGreaterThan(String value) {
            addCriterion("collectTime >", value, "collecttime");
            return (Criteria) this;
        }

        public Criteria andCollecttimeGreaterThanOrEqualTo(String value) {
            addCriterion("collectTime >=", value, "collecttime");
            return (Criteria) this;
        }

        public Criteria andCollecttimeLessThan(String value) {
            addCriterion("collectTime <", value, "collecttime");
            return (Criteria) this;
        }

        public Criteria andCollecttimeLessThanOrEqualTo(String value) {
            addCriterion("collectTime <=", value, "collecttime");
            return (Criteria) this;
        }

        public Criteria andCollecttimeLike(String value) {
            addCriterion("collectTime like", value, "collecttime");
            return (Criteria) this;
        }

        public Criteria andCollecttimeNotLike(String value) {
            addCriterion("collectTime not like", value, "collecttime");
            return (Criteria) this;
        }

        public Criteria andCollecttimeIn(List<String> values) {
            addCriterion("collectTime in", values, "collecttime");
            return (Criteria) this;
        }

        public Criteria andCollecttimeNotIn(List<String> values) {
            addCriterion("collectTime not in", values, "collecttime");
            return (Criteria) this;
        }

        public Criteria andCollecttimeBetween(String value1, String value2) {
            addCriterion("collectTime between", value1, value2, "collecttime");
            return (Criteria) this;
        }

        public Criteria andCollecttimeNotBetween(String value1, String value2) {
            addCriterion("collectTime not between", value1, value2, "collecttime");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}