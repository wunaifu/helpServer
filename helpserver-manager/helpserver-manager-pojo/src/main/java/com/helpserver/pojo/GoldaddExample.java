package com.helpserver.pojo;

import java.util.ArrayList;
import java.util.List;

public class GoldaddExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public GoldaddExample() {
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andUseridIsNull() {
            addCriterion("userId is null");
            return (Criteria) this;
        }

        public Criteria andUseridIsNotNull() {
            addCriterion("userId is not null");
            return (Criteria) this;
        }

        public Criteria andUseridEqualTo(Integer value) {
            addCriterion("userId =", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotEqualTo(Integer value) {
            addCriterion("userId <>", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThan(Integer value) {
            addCriterion("userId >", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("userId >=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThan(Integer value) {
            addCriterion("userId <", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThanOrEqualTo(Integer value) {
            addCriterion("userId <=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridIn(List<Integer> values) {
            addCriterion("userId in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotIn(List<Integer> values) {
            addCriterion("userId not in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridBetween(Integer value1, Integer value2) {
            addCriterion("userId between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotBetween(Integer value1, Integer value2) {
            addCriterion("userId not between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andAddamountIsNull() {
            addCriterion("addAmount is null");
            return (Criteria) this;
        }

        public Criteria andAddamountIsNotNull() {
            addCriterion("addAmount is not null");
            return (Criteria) this;
        }

        public Criteria andAddamountEqualTo(Integer value) {
            addCriterion("addAmount =", value, "addamount");
            return (Criteria) this;
        }

        public Criteria andAddamountNotEqualTo(Integer value) {
            addCriterion("addAmount <>", value, "addamount");
            return (Criteria) this;
        }

        public Criteria andAddamountGreaterThan(Integer value) {
            addCriterion("addAmount >", value, "addamount");
            return (Criteria) this;
        }

        public Criteria andAddamountGreaterThanOrEqualTo(Integer value) {
            addCriterion("addAmount >=", value, "addamount");
            return (Criteria) this;
        }

        public Criteria andAddamountLessThan(Integer value) {
            addCriterion("addAmount <", value, "addamount");
            return (Criteria) this;
        }

        public Criteria andAddamountLessThanOrEqualTo(Integer value) {
            addCriterion("addAmount <=", value, "addamount");
            return (Criteria) this;
        }

        public Criteria andAddamountIn(List<Integer> values) {
            addCriterion("addAmount in", values, "addamount");
            return (Criteria) this;
        }

        public Criteria andAddamountNotIn(List<Integer> values) {
            addCriterion("addAmount not in", values, "addamount");
            return (Criteria) this;
        }

        public Criteria andAddamountBetween(Integer value1, Integer value2) {
            addCriterion("addAmount between", value1, value2, "addamount");
            return (Criteria) this;
        }

        public Criteria andAddamountNotBetween(Integer value1, Integer value2) {
            addCriterion("addAmount not between", value1, value2, "addamount");
            return (Criteria) this;
        }

        public Criteria andAddtimeIsNull() {
            addCriterion("addTime is null");
            return (Criteria) this;
        }

        public Criteria andAddtimeIsNotNull() {
            addCriterion("addTime is not null");
            return (Criteria) this;
        }

        public Criteria andAddtimeEqualTo(String value) {
            addCriterion("addTime =", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeNotEqualTo(String value) {
            addCriterion("addTime <>", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeGreaterThan(String value) {
            addCriterion("addTime >", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeGreaterThanOrEqualTo(String value) {
            addCriterion("addTime >=", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeLessThan(String value) {
            addCriterion("addTime <", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeLessThanOrEqualTo(String value) {
            addCriterion("addTime <=", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeLike(String value) {
            addCriterion("addTime like", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeNotLike(String value) {
            addCriterion("addTime not like", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeIn(List<String> values) {
            addCriterion("addTime in", values, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeNotIn(List<String> values) {
            addCriterion("addTime not in", values, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeBetween(String value1, String value2) {
            addCriterion("addTime between", value1, value2, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeNotBetween(String value1, String value2) {
            addCriterion("addTime not between", value1, value2, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddphotoIsNull() {
            addCriterion("addPhoto is null");
            return (Criteria) this;
        }

        public Criteria andAddphotoIsNotNull() {
            addCriterion("addPhoto is not null");
            return (Criteria) this;
        }

        public Criteria andAddphotoEqualTo(String value) {
            addCriterion("addPhoto =", value, "addphoto");
            return (Criteria) this;
        }

        public Criteria andAddphotoNotEqualTo(String value) {
            addCriterion("addPhoto <>", value, "addphoto");
            return (Criteria) this;
        }

        public Criteria andAddphotoGreaterThan(String value) {
            addCriterion("addPhoto >", value, "addphoto");
            return (Criteria) this;
        }

        public Criteria andAddphotoGreaterThanOrEqualTo(String value) {
            addCriterion("addPhoto >=", value, "addphoto");
            return (Criteria) this;
        }

        public Criteria andAddphotoLessThan(String value) {
            addCriterion("addPhoto <", value, "addphoto");
            return (Criteria) this;
        }

        public Criteria andAddphotoLessThanOrEqualTo(String value) {
            addCriterion("addPhoto <=", value, "addphoto");
            return (Criteria) this;
        }

        public Criteria andAddphotoLike(String value) {
            addCriterion("addPhoto like", value, "addphoto");
            return (Criteria) this;
        }

        public Criteria andAddphotoNotLike(String value) {
            addCriterion("addPhoto not like", value, "addphoto");
            return (Criteria) this;
        }

        public Criteria andAddphotoIn(List<String> values) {
            addCriterion("addPhoto in", values, "addphoto");
            return (Criteria) this;
        }

        public Criteria andAddphotoNotIn(List<String> values) {
            addCriterion("addPhoto not in", values, "addphoto");
            return (Criteria) this;
        }

        public Criteria andAddphotoBetween(String value1, String value2) {
            addCriterion("addPhoto between", value1, value2, "addphoto");
            return (Criteria) this;
        }

        public Criteria andAddphotoNotBetween(String value1, String value2) {
            addCriterion("addPhoto not between", value1, value2, "addphoto");
            return (Criteria) this;
        }

        public Criteria andGettimeIsNull() {
            addCriterion("getTime is null");
            return (Criteria) this;
        }

        public Criteria andGettimeIsNotNull() {
            addCriterion("getTime is not null");
            return (Criteria) this;
        }

        public Criteria andGettimeEqualTo(String value) {
            addCriterion("getTime =", value, "gettime");
            return (Criteria) this;
        }

        public Criteria andGettimeNotEqualTo(String value) {
            addCriterion("getTime <>", value, "gettime");
            return (Criteria) this;
        }

        public Criteria andGettimeGreaterThan(String value) {
            addCriterion("getTime >", value, "gettime");
            return (Criteria) this;
        }

        public Criteria andGettimeGreaterThanOrEqualTo(String value) {
            addCriterion("getTime >=", value, "gettime");
            return (Criteria) this;
        }

        public Criteria andGettimeLessThan(String value) {
            addCriterion("getTime <", value, "gettime");
            return (Criteria) this;
        }

        public Criteria andGettimeLessThanOrEqualTo(String value) {
            addCriterion("getTime <=", value, "gettime");
            return (Criteria) this;
        }

        public Criteria andGettimeLike(String value) {
            addCriterion("getTime like", value, "gettime");
            return (Criteria) this;
        }

        public Criteria andGettimeNotLike(String value) {
            addCriterion("getTime not like", value, "gettime");
            return (Criteria) this;
        }

        public Criteria andGettimeIn(List<String> values) {
            addCriterion("getTime in", values, "gettime");
            return (Criteria) this;
        }

        public Criteria andGettimeNotIn(List<String> values) {
            addCriterion("getTime not in", values, "gettime");
            return (Criteria) this;
        }

        public Criteria andGettimeBetween(String value1, String value2) {
            addCriterion("getTime between", value1, value2, "gettime");
            return (Criteria) this;
        }

        public Criteria andGettimeNotBetween(String value1, String value2) {
            addCriterion("getTime not between", value1, value2, "gettime");
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