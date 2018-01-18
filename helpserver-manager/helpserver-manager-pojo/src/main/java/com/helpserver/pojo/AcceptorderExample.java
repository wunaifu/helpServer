package com.helpserver.pojo;

import java.util.ArrayList;
import java.util.List;

public class AcceptorderExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public AcceptorderExample() {
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

        public Criteria andAcceptorderidIsNull() {
            addCriterion("acceptorderId is null");
            return (Criteria) this;
        }

        public Criteria andAcceptorderidIsNotNull() {
            addCriterion("acceptorderId is not null");
            return (Criteria) this;
        }

        public Criteria andAcceptorderidEqualTo(Integer value) {
            addCriterion("acceptorderId =", value, "acceptorderid");
            return (Criteria) this;
        }

        public Criteria andAcceptorderidNotEqualTo(Integer value) {
            addCriterion("acceptorderId <>", value, "acceptorderid");
            return (Criteria) this;
        }

        public Criteria andAcceptorderidGreaterThan(Integer value) {
            addCriterion("acceptorderId >", value, "acceptorderid");
            return (Criteria) this;
        }

        public Criteria andAcceptorderidGreaterThanOrEqualTo(Integer value) {
            addCriterion("acceptorderId >=", value, "acceptorderid");
            return (Criteria) this;
        }

        public Criteria andAcceptorderidLessThan(Integer value) {
            addCriterion("acceptorderId <", value, "acceptorderid");
            return (Criteria) this;
        }

        public Criteria andAcceptorderidLessThanOrEqualTo(Integer value) {
            addCriterion("acceptorderId <=", value, "acceptorderid");
            return (Criteria) this;
        }

        public Criteria andAcceptorderidIn(List<Integer> values) {
            addCriterion("acceptorderId in", values, "acceptorderid");
            return (Criteria) this;
        }

        public Criteria andAcceptorderidNotIn(List<Integer> values) {
            addCriterion("acceptorderId not in", values, "acceptorderid");
            return (Criteria) this;
        }

        public Criteria andAcceptorderidBetween(Integer value1, Integer value2) {
            addCriterion("acceptorderId between", value1, value2, "acceptorderid");
            return (Criteria) this;
        }

        public Criteria andAcceptorderidNotBetween(Integer value1, Integer value2) {
            addCriterion("acceptorderId not between", value1, value2, "acceptorderid");
            return (Criteria) this;
        }

        public Criteria andAccepteridIsNull() {
            addCriterion("accepterId is null");
            return (Criteria) this;
        }

        public Criteria andAccepteridIsNotNull() {
            addCriterion("accepterId is not null");
            return (Criteria) this;
        }

        public Criteria andAccepteridEqualTo(Integer value) {
            addCriterion("accepterId =", value, "accepterid");
            return (Criteria) this;
        }

        public Criteria andAccepteridNotEqualTo(Integer value) {
            addCriterion("accepterId <>", value, "accepterid");
            return (Criteria) this;
        }

        public Criteria andAccepteridGreaterThan(Integer value) {
            addCriterion("accepterId >", value, "accepterid");
            return (Criteria) this;
        }

        public Criteria andAccepteridGreaterThanOrEqualTo(Integer value) {
            addCriterion("accepterId >=", value, "accepterid");
            return (Criteria) this;
        }

        public Criteria andAccepteridLessThan(Integer value) {
            addCriterion("accepterId <", value, "accepterid");
            return (Criteria) this;
        }

        public Criteria andAccepteridLessThanOrEqualTo(Integer value) {
            addCriterion("accepterId <=", value, "accepterid");
            return (Criteria) this;
        }

        public Criteria andAccepteridIn(List<Integer> values) {
            addCriterion("accepterId in", values, "accepterid");
            return (Criteria) this;
        }

        public Criteria andAccepteridNotIn(List<Integer> values) {
            addCriterion("accepterId not in", values, "accepterid");
            return (Criteria) this;
        }

        public Criteria andAccepteridBetween(Integer value1, Integer value2) {
            addCriterion("accepterId between", value1, value2, "accepterid");
            return (Criteria) this;
        }

        public Criteria andAccepteridNotBetween(Integer value1, Integer value2) {
            addCriterion("accepterId not between", value1, value2, "accepterid");
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

        public Criteria andAccepttimeIsNull() {
            addCriterion("acceptTime is null");
            return (Criteria) this;
        }

        public Criteria andAccepttimeIsNotNull() {
            addCriterion("acceptTime is not null");
            return (Criteria) this;
        }

        public Criteria andAccepttimeEqualTo(String value) {
            addCriterion("acceptTime =", value, "accepttime");
            return (Criteria) this;
        }

        public Criteria andAccepttimeNotEqualTo(String value) {
            addCriterion("acceptTime <>", value, "accepttime");
            return (Criteria) this;
        }

        public Criteria andAccepttimeGreaterThan(String value) {
            addCriterion("acceptTime >", value, "accepttime");
            return (Criteria) this;
        }

        public Criteria andAccepttimeGreaterThanOrEqualTo(String value) {
            addCriterion("acceptTime >=", value, "accepttime");
            return (Criteria) this;
        }

        public Criteria andAccepttimeLessThan(String value) {
            addCriterion("acceptTime <", value, "accepttime");
            return (Criteria) this;
        }

        public Criteria andAccepttimeLessThanOrEqualTo(String value) {
            addCriterion("acceptTime <=", value, "accepttime");
            return (Criteria) this;
        }

        public Criteria andAccepttimeLike(String value) {
            addCriterion("acceptTime like", value, "accepttime");
            return (Criteria) this;
        }

        public Criteria andAccepttimeNotLike(String value) {
            addCriterion("acceptTime not like", value, "accepttime");
            return (Criteria) this;
        }

        public Criteria andAccepttimeIn(List<String> values) {
            addCriterion("acceptTime in", values, "accepttime");
            return (Criteria) this;
        }

        public Criteria andAccepttimeNotIn(List<String> values) {
            addCriterion("acceptTime not in", values, "accepttime");
            return (Criteria) this;
        }

        public Criteria andAccepttimeBetween(String value1, String value2) {
            addCriterion("acceptTime between", value1, value2, "accepttime");
            return (Criteria) this;
        }

        public Criteria andAccepttimeNotBetween(String value1, String value2) {
            addCriterion("acceptTime not between", value1, value2, "accepttime");
            return (Criteria) this;
        }

        public Criteria andBackreasonIsNull() {
            addCriterion("backReason is null");
            return (Criteria) this;
        }

        public Criteria andBackreasonIsNotNull() {
            addCriterion("backReason is not null");
            return (Criteria) this;
        }

        public Criteria andBackreasonEqualTo(String value) {
            addCriterion("backReason =", value, "backreason");
            return (Criteria) this;
        }

        public Criteria andBackreasonNotEqualTo(String value) {
            addCriterion("backReason <>", value, "backreason");
            return (Criteria) this;
        }

        public Criteria andBackreasonGreaterThan(String value) {
            addCriterion("backReason >", value, "backreason");
            return (Criteria) this;
        }

        public Criteria andBackreasonGreaterThanOrEqualTo(String value) {
            addCriterion("backReason >=", value, "backreason");
            return (Criteria) this;
        }

        public Criteria andBackreasonLessThan(String value) {
            addCriterion("backReason <", value, "backreason");
            return (Criteria) this;
        }

        public Criteria andBackreasonLessThanOrEqualTo(String value) {
            addCriterion("backReason <=", value, "backreason");
            return (Criteria) this;
        }

        public Criteria andBackreasonLike(String value) {
            addCriterion("backReason like", value, "backreason");
            return (Criteria) this;
        }

        public Criteria andBackreasonNotLike(String value) {
            addCriterion("backReason not like", value, "backreason");
            return (Criteria) this;
        }

        public Criteria andBackreasonIn(List<String> values) {
            addCriterion("backReason in", values, "backreason");
            return (Criteria) this;
        }

        public Criteria andBackreasonNotIn(List<String> values) {
            addCriterion("backReason not in", values, "backreason");
            return (Criteria) this;
        }

        public Criteria andBackreasonBetween(String value1, String value2) {
            addCriterion("backReason between", value1, value2, "backreason");
            return (Criteria) this;
        }

        public Criteria andBackreasonNotBetween(String value1, String value2) {
            addCriterion("backReason not between", value1, value2, "backreason");
            return (Criteria) this;
        }

        public Criteria andBacktimeIsNull() {
            addCriterion("backTime is null");
            return (Criteria) this;
        }

        public Criteria andBacktimeIsNotNull() {
            addCriterion("backTime is not null");
            return (Criteria) this;
        }

        public Criteria andBacktimeEqualTo(String value) {
            addCriterion("backTime =", value, "backtime");
            return (Criteria) this;
        }

        public Criteria andBacktimeNotEqualTo(String value) {
            addCriterion("backTime <>", value, "backtime");
            return (Criteria) this;
        }

        public Criteria andBacktimeGreaterThan(String value) {
            addCriterion("backTime >", value, "backtime");
            return (Criteria) this;
        }

        public Criteria andBacktimeGreaterThanOrEqualTo(String value) {
            addCriterion("backTime >=", value, "backtime");
            return (Criteria) this;
        }

        public Criteria andBacktimeLessThan(String value) {
            addCriterion("backTime <", value, "backtime");
            return (Criteria) this;
        }

        public Criteria andBacktimeLessThanOrEqualTo(String value) {
            addCriterion("backTime <=", value, "backtime");
            return (Criteria) this;
        }

        public Criteria andBacktimeLike(String value) {
            addCriterion("backTime like", value, "backtime");
            return (Criteria) this;
        }

        public Criteria andBacktimeNotLike(String value) {
            addCriterion("backTime not like", value, "backtime");
            return (Criteria) this;
        }

        public Criteria andBacktimeIn(List<String> values) {
            addCriterion("backTime in", values, "backtime");
            return (Criteria) this;
        }

        public Criteria andBacktimeNotIn(List<String> values) {
            addCriterion("backTime not in", values, "backtime");
            return (Criteria) this;
        }

        public Criteria andBacktimeBetween(String value1, String value2) {
            addCriterion("backTime between", value1, value2, "backtime");
            return (Criteria) this;
        }

        public Criteria andBacktimeNotBetween(String value1, String value2) {
            addCriterion("backTime not between", value1, value2, "backtime");
            return (Criteria) this;
        }

        public Criteria andAcceptstateIsNull() {
            addCriterion("acceptState is null");
            return (Criteria) this;
        }

        public Criteria andAcceptstateIsNotNull() {
            addCriterion("acceptState is not null");
            return (Criteria) this;
        }

        public Criteria andAcceptstateEqualTo(Integer value) {
            addCriterion("acceptState =", value, "acceptstate");
            return (Criteria) this;
        }

        public Criteria andAcceptstateNotEqualTo(Integer value) {
            addCriterion("acceptState <>", value, "acceptstate");
            return (Criteria) this;
        }

        public Criteria andAcceptstateGreaterThan(Integer value) {
            addCriterion("acceptState >", value, "acceptstate");
            return (Criteria) this;
        }

        public Criteria andAcceptstateGreaterThanOrEqualTo(Integer value) {
            addCriterion("acceptState >=", value, "acceptstate");
            return (Criteria) this;
        }

        public Criteria andAcceptstateLessThan(Integer value) {
            addCriterion("acceptState <", value, "acceptstate");
            return (Criteria) this;
        }

        public Criteria andAcceptstateLessThanOrEqualTo(Integer value) {
            addCriterion("acceptState <=", value, "acceptstate");
            return (Criteria) this;
        }

        public Criteria andAcceptstateIn(List<Integer> values) {
            addCriterion("acceptState in", values, "acceptstate");
            return (Criteria) this;
        }

        public Criteria andAcceptstateNotIn(List<Integer> values) {
            addCriterion("acceptState not in", values, "acceptstate");
            return (Criteria) this;
        }

        public Criteria andAcceptstateBetween(Integer value1, Integer value2) {
            addCriterion("acceptState between", value1, value2, "acceptstate");
            return (Criteria) this;
        }

        public Criteria andAcceptstateNotBetween(Integer value1, Integer value2) {
            addCriterion("acceptState not between", value1, value2, "acceptstate");
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