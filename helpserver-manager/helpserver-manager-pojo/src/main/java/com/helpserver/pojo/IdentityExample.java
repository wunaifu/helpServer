package com.helpserver.pojo;

import java.util.ArrayList;
import java.util.List;

public class IdentityExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public IdentityExample() {
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

        public Criteria andFrontphotoIsNull() {
            addCriterion("frontPhoto is null");
            return (Criteria) this;
        }

        public Criteria andFrontphotoIsNotNull() {
            addCriterion("frontPhoto is not null");
            return (Criteria) this;
        }

        public Criteria andFrontphotoEqualTo(String value) {
            addCriterion("frontPhoto =", value, "frontphoto");
            return (Criteria) this;
        }

        public Criteria andFrontphotoNotEqualTo(String value) {
            addCriterion("frontPhoto <>", value, "frontphoto");
            return (Criteria) this;
        }

        public Criteria andFrontphotoGreaterThan(String value) {
            addCriterion("frontPhoto >", value, "frontphoto");
            return (Criteria) this;
        }

        public Criteria andFrontphotoGreaterThanOrEqualTo(String value) {
            addCriterion("frontPhoto >=", value, "frontphoto");
            return (Criteria) this;
        }

        public Criteria andFrontphotoLessThan(String value) {
            addCriterion("frontPhoto <", value, "frontphoto");
            return (Criteria) this;
        }

        public Criteria andFrontphotoLessThanOrEqualTo(String value) {
            addCriterion("frontPhoto <=", value, "frontphoto");
            return (Criteria) this;
        }

        public Criteria andFrontphotoLike(String value) {
            addCriterion("frontPhoto like", value, "frontphoto");
            return (Criteria) this;
        }

        public Criteria andFrontphotoNotLike(String value) {
            addCriterion("frontPhoto not like", value, "frontphoto");
            return (Criteria) this;
        }

        public Criteria andFrontphotoIn(List<String> values) {
            addCriterion("frontPhoto in", values, "frontphoto");
            return (Criteria) this;
        }

        public Criteria andFrontphotoNotIn(List<String> values) {
            addCriterion("frontPhoto not in", values, "frontphoto");
            return (Criteria) this;
        }

        public Criteria andFrontphotoBetween(String value1, String value2) {
            addCriterion("frontPhoto between", value1, value2, "frontphoto");
            return (Criteria) this;
        }

        public Criteria andFrontphotoNotBetween(String value1, String value2) {
            addCriterion("frontPhoto not between", value1, value2, "frontphoto");
            return (Criteria) this;
        }

        public Criteria andBackphotoIsNull() {
            addCriterion("backPhoto is null");
            return (Criteria) this;
        }

        public Criteria andBackphotoIsNotNull() {
            addCriterion("backPhoto is not null");
            return (Criteria) this;
        }

        public Criteria andBackphotoEqualTo(String value) {
            addCriterion("backPhoto =", value, "backphoto");
            return (Criteria) this;
        }

        public Criteria andBackphotoNotEqualTo(String value) {
            addCriterion("backPhoto <>", value, "backphoto");
            return (Criteria) this;
        }

        public Criteria andBackphotoGreaterThan(String value) {
            addCriterion("backPhoto >", value, "backphoto");
            return (Criteria) this;
        }

        public Criteria andBackphotoGreaterThanOrEqualTo(String value) {
            addCriterion("backPhoto >=", value, "backphoto");
            return (Criteria) this;
        }

        public Criteria andBackphotoLessThan(String value) {
            addCriterion("backPhoto <", value, "backphoto");
            return (Criteria) this;
        }

        public Criteria andBackphotoLessThanOrEqualTo(String value) {
            addCriterion("backPhoto <=", value, "backphoto");
            return (Criteria) this;
        }

        public Criteria andBackphotoLike(String value) {
            addCriterion("backPhoto like", value, "backphoto");
            return (Criteria) this;
        }

        public Criteria andBackphotoNotLike(String value) {
            addCriterion("backPhoto not like", value, "backphoto");
            return (Criteria) this;
        }

        public Criteria andBackphotoIn(List<String> values) {
            addCriterion("backPhoto in", values, "backphoto");
            return (Criteria) this;
        }

        public Criteria andBackphotoNotIn(List<String> values) {
            addCriterion("backPhoto not in", values, "backphoto");
            return (Criteria) this;
        }

        public Criteria andBackphotoBetween(String value1, String value2) {
            addCriterion("backPhoto between", value1, value2, "backphoto");
            return (Criteria) this;
        }

        public Criteria andBackphotoNotBetween(String value1, String value2) {
            addCriterion("backPhoto not between", value1, value2, "backphoto");
            return (Criteria) this;
        }

        public Criteria andAsktimeIsNull() {
            addCriterion("askTime is null");
            return (Criteria) this;
        }

        public Criteria andAsktimeIsNotNull() {
            addCriterion("askTime is not null");
            return (Criteria) this;
        }

        public Criteria andAsktimeEqualTo(String value) {
            addCriterion("askTime =", value, "asktime");
            return (Criteria) this;
        }

        public Criteria andAsktimeNotEqualTo(String value) {
            addCriterion("askTime <>", value, "asktime");
            return (Criteria) this;
        }

        public Criteria andAsktimeGreaterThan(String value) {
            addCriterion("askTime >", value, "asktime");
            return (Criteria) this;
        }

        public Criteria andAsktimeGreaterThanOrEqualTo(String value) {
            addCriterion("askTime >=", value, "asktime");
            return (Criteria) this;
        }

        public Criteria andAsktimeLessThan(String value) {
            addCriterion("askTime <", value, "asktime");
            return (Criteria) this;
        }

        public Criteria andAsktimeLessThanOrEqualTo(String value) {
            addCriterion("askTime <=", value, "asktime");
            return (Criteria) this;
        }

        public Criteria andAsktimeLike(String value) {
            addCriterion("askTime like", value, "asktime");
            return (Criteria) this;
        }

        public Criteria andAsktimeNotLike(String value) {
            addCriterion("askTime not like", value, "asktime");
            return (Criteria) this;
        }

        public Criteria andAsktimeIn(List<String> values) {
            addCriterion("askTime in", values, "asktime");
            return (Criteria) this;
        }

        public Criteria andAsktimeNotIn(List<String> values) {
            addCriterion("askTime not in", values, "asktime");
            return (Criteria) this;
        }

        public Criteria andAsktimeBetween(String value1, String value2) {
            addCriterion("askTime between", value1, value2, "asktime");
            return (Criteria) this;
        }

        public Criteria andAsktimeNotBetween(String value1, String value2) {
            addCriterion("askTime not between", value1, value2, "asktime");
            return (Criteria) this;
        }

        public Criteria andChecktimeIsNull() {
            addCriterion("checkTime is null");
            return (Criteria) this;
        }

        public Criteria andChecktimeIsNotNull() {
            addCriterion("checkTime is not null");
            return (Criteria) this;
        }

        public Criteria andChecktimeEqualTo(String value) {
            addCriterion("checkTime =", value, "checktime");
            return (Criteria) this;
        }

        public Criteria andChecktimeNotEqualTo(String value) {
            addCriterion("checkTime <>", value, "checktime");
            return (Criteria) this;
        }

        public Criteria andChecktimeGreaterThan(String value) {
            addCriterion("checkTime >", value, "checktime");
            return (Criteria) this;
        }

        public Criteria andChecktimeGreaterThanOrEqualTo(String value) {
            addCriterion("checkTime >=", value, "checktime");
            return (Criteria) this;
        }

        public Criteria andChecktimeLessThan(String value) {
            addCriterion("checkTime <", value, "checktime");
            return (Criteria) this;
        }

        public Criteria andChecktimeLessThanOrEqualTo(String value) {
            addCriterion("checkTime <=", value, "checktime");
            return (Criteria) this;
        }

        public Criteria andChecktimeLike(String value) {
            addCriterion("checkTime like", value, "checktime");
            return (Criteria) this;
        }

        public Criteria andChecktimeNotLike(String value) {
            addCriterion("checkTime not like", value, "checktime");
            return (Criteria) this;
        }

        public Criteria andChecktimeIn(List<String> values) {
            addCriterion("checkTime in", values, "checktime");
            return (Criteria) this;
        }

        public Criteria andChecktimeNotIn(List<String> values) {
            addCriterion("checkTime not in", values, "checktime");
            return (Criteria) this;
        }

        public Criteria andChecktimeBetween(String value1, String value2) {
            addCriterion("checkTime between", value1, value2, "checktime");
            return (Criteria) this;
        }

        public Criteria andChecktimeNotBetween(String value1, String value2) {
            addCriterion("checkTime not between", value1, value2, "checktime");
            return (Criteria) this;
        }

        public Criteria andFailurereasonIsNull() {
            addCriterion("failureReason is null");
            return (Criteria) this;
        }

        public Criteria andFailurereasonIsNotNull() {
            addCriterion("failureReason is not null");
            return (Criteria) this;
        }

        public Criteria andFailurereasonEqualTo(String value) {
            addCriterion("failureReason =", value, "failurereason");
            return (Criteria) this;
        }

        public Criteria andFailurereasonNotEqualTo(String value) {
            addCriterion("failureReason <>", value, "failurereason");
            return (Criteria) this;
        }

        public Criteria andFailurereasonGreaterThan(String value) {
            addCriterion("failureReason >", value, "failurereason");
            return (Criteria) this;
        }

        public Criteria andFailurereasonGreaterThanOrEqualTo(String value) {
            addCriterion("failureReason >=", value, "failurereason");
            return (Criteria) this;
        }

        public Criteria andFailurereasonLessThan(String value) {
            addCriterion("failureReason <", value, "failurereason");
            return (Criteria) this;
        }

        public Criteria andFailurereasonLessThanOrEqualTo(String value) {
            addCriterion("failureReason <=", value, "failurereason");
            return (Criteria) this;
        }

        public Criteria andFailurereasonLike(String value) {
            addCriterion("failureReason like", value, "failurereason");
            return (Criteria) this;
        }

        public Criteria andFailurereasonNotLike(String value) {
            addCriterion("failureReason not like", value, "failurereason");
            return (Criteria) this;
        }

        public Criteria andFailurereasonIn(List<String> values) {
            addCriterion("failureReason in", values, "failurereason");
            return (Criteria) this;
        }

        public Criteria andFailurereasonNotIn(List<String> values) {
            addCriterion("failureReason not in", values, "failurereason");
            return (Criteria) this;
        }

        public Criteria andFailurereasonBetween(String value1, String value2) {
            addCriterion("failureReason between", value1, value2, "failurereason");
            return (Criteria) this;
        }

        public Criteria andFailurereasonNotBetween(String value1, String value2) {
            addCriterion("failureReason not between", value1, value2, "failurereason");
            return (Criteria) this;
        }

        public Criteria andCheckstateIsNull() {
            addCriterion("checkState is null");
            return (Criteria) this;
        }

        public Criteria andCheckstateIsNotNull() {
            addCriterion("checkState is not null");
            return (Criteria) this;
        }

        public Criteria andCheckstateEqualTo(Integer value) {
            addCriterion("checkState =", value, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateNotEqualTo(Integer value) {
            addCriterion("checkState <>", value, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateGreaterThan(Integer value) {
            addCriterion("checkState >", value, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateGreaterThanOrEqualTo(Integer value) {
            addCriterion("checkState >=", value, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateLessThan(Integer value) {
            addCriterion("checkState <", value, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateLessThanOrEqualTo(Integer value) {
            addCriterion("checkState <=", value, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateIn(List<Integer> values) {
            addCriterion("checkState in", values, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateNotIn(List<Integer> values) {
            addCriterion("checkState not in", values, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateBetween(Integer value1, Integer value2) {
            addCriterion("checkState between", value1, value2, "checkstate");
            return (Criteria) this;
        }

        public Criteria andCheckstateNotBetween(Integer value1, Integer value2) {
            addCriterion("checkState not between", value1, value2, "checkstate");
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