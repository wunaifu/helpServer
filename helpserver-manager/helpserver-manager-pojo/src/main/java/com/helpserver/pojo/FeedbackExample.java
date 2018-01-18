package com.helpserver.pojo;

import java.util.ArrayList;
import java.util.List;

public class FeedbackExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public FeedbackExample() {
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

        public Criteria andFeedbackidIsNull() {
            addCriterion("feedbackId is null");
            return (Criteria) this;
        }

        public Criteria andFeedbackidIsNotNull() {
            addCriterion("feedbackId is not null");
            return (Criteria) this;
        }

        public Criteria andFeedbackidEqualTo(Integer value) {
            addCriterion("feedbackId =", value, "feedbackid");
            return (Criteria) this;
        }

        public Criteria andFeedbackidNotEqualTo(Integer value) {
            addCriterion("feedbackId <>", value, "feedbackid");
            return (Criteria) this;
        }

        public Criteria andFeedbackidGreaterThan(Integer value) {
            addCriterion("feedbackId >", value, "feedbackid");
            return (Criteria) this;
        }

        public Criteria andFeedbackidGreaterThanOrEqualTo(Integer value) {
            addCriterion("feedbackId >=", value, "feedbackid");
            return (Criteria) this;
        }

        public Criteria andFeedbackidLessThan(Integer value) {
            addCriterion("feedbackId <", value, "feedbackid");
            return (Criteria) this;
        }

        public Criteria andFeedbackidLessThanOrEqualTo(Integer value) {
            addCriterion("feedbackId <=", value, "feedbackid");
            return (Criteria) this;
        }

        public Criteria andFeedbackidIn(List<Integer> values) {
            addCriterion("feedbackId in", values, "feedbackid");
            return (Criteria) this;
        }

        public Criteria andFeedbackidNotIn(List<Integer> values) {
            addCriterion("feedbackId not in", values, "feedbackid");
            return (Criteria) this;
        }

        public Criteria andFeedbackidBetween(Integer value1, Integer value2) {
            addCriterion("feedbackId between", value1, value2, "feedbackid");
            return (Criteria) this;
        }

        public Criteria andFeedbackidNotBetween(Integer value1, Integer value2) {
            addCriterion("feedbackId not between", value1, value2, "feedbackid");
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

        public Criteria andFeedbackinfoIsNull() {
            addCriterion("feedbackInfo is null");
            return (Criteria) this;
        }

        public Criteria andFeedbackinfoIsNotNull() {
            addCriterion("feedbackInfo is not null");
            return (Criteria) this;
        }

        public Criteria andFeedbackinfoEqualTo(String value) {
            addCriterion("feedbackInfo =", value, "feedbackinfo");
            return (Criteria) this;
        }

        public Criteria andFeedbackinfoNotEqualTo(String value) {
            addCriterion("feedbackInfo <>", value, "feedbackinfo");
            return (Criteria) this;
        }

        public Criteria andFeedbackinfoGreaterThan(String value) {
            addCriterion("feedbackInfo >", value, "feedbackinfo");
            return (Criteria) this;
        }

        public Criteria andFeedbackinfoGreaterThanOrEqualTo(String value) {
            addCriterion("feedbackInfo >=", value, "feedbackinfo");
            return (Criteria) this;
        }

        public Criteria andFeedbackinfoLessThan(String value) {
            addCriterion("feedbackInfo <", value, "feedbackinfo");
            return (Criteria) this;
        }

        public Criteria andFeedbackinfoLessThanOrEqualTo(String value) {
            addCriterion("feedbackInfo <=", value, "feedbackinfo");
            return (Criteria) this;
        }

        public Criteria andFeedbackinfoLike(String value) {
            addCriterion("feedbackInfo like", value, "feedbackinfo");
            return (Criteria) this;
        }

        public Criteria andFeedbackinfoNotLike(String value) {
            addCriterion("feedbackInfo not like", value, "feedbackinfo");
            return (Criteria) this;
        }

        public Criteria andFeedbackinfoIn(List<String> values) {
            addCriterion("feedbackInfo in", values, "feedbackinfo");
            return (Criteria) this;
        }

        public Criteria andFeedbackinfoNotIn(List<String> values) {
            addCriterion("feedbackInfo not in", values, "feedbackinfo");
            return (Criteria) this;
        }

        public Criteria andFeedbackinfoBetween(String value1, String value2) {
            addCriterion("feedbackInfo between", value1, value2, "feedbackinfo");
            return (Criteria) this;
        }

        public Criteria andFeedbackinfoNotBetween(String value1, String value2) {
            addCriterion("feedbackInfo not between", value1, value2, "feedbackinfo");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeIsNull() {
            addCriterion("feedbackTime is null");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeIsNotNull() {
            addCriterion("feedbackTime is not null");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeEqualTo(String value) {
            addCriterion("feedbackTime =", value, "feedbacktime");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeNotEqualTo(String value) {
            addCriterion("feedbackTime <>", value, "feedbacktime");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeGreaterThan(String value) {
            addCriterion("feedbackTime >", value, "feedbacktime");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeGreaterThanOrEqualTo(String value) {
            addCriterion("feedbackTime >=", value, "feedbacktime");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeLessThan(String value) {
            addCriterion("feedbackTime <", value, "feedbacktime");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeLessThanOrEqualTo(String value) {
            addCriterion("feedbackTime <=", value, "feedbacktime");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeLike(String value) {
            addCriterion("feedbackTime like", value, "feedbacktime");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeNotLike(String value) {
            addCriterion("feedbackTime not like", value, "feedbacktime");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeIn(List<String> values) {
            addCriterion("feedbackTime in", values, "feedbacktime");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeNotIn(List<String> values) {
            addCriterion("feedbackTime not in", values, "feedbacktime");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeBetween(String value1, String value2) {
            addCriterion("feedbackTime between", value1, value2, "feedbacktime");
            return (Criteria) this;
        }

        public Criteria andFeedbacktimeNotBetween(String value1, String value2) {
            addCriterion("feedbackTime not between", value1, value2, "feedbacktime");
            return (Criteria) this;
        }

        public Criteria andReplyIsNull() {
            addCriterion("reply is null");
            return (Criteria) this;
        }

        public Criteria andReplyIsNotNull() {
            addCriterion("reply is not null");
            return (Criteria) this;
        }

        public Criteria andReplyEqualTo(String value) {
            addCriterion("reply =", value, "reply");
            return (Criteria) this;
        }

        public Criteria andReplyNotEqualTo(String value) {
            addCriterion("reply <>", value, "reply");
            return (Criteria) this;
        }

        public Criteria andReplyGreaterThan(String value) {
            addCriterion("reply >", value, "reply");
            return (Criteria) this;
        }

        public Criteria andReplyGreaterThanOrEqualTo(String value) {
            addCriterion("reply >=", value, "reply");
            return (Criteria) this;
        }

        public Criteria andReplyLessThan(String value) {
            addCriterion("reply <", value, "reply");
            return (Criteria) this;
        }

        public Criteria andReplyLessThanOrEqualTo(String value) {
            addCriterion("reply <=", value, "reply");
            return (Criteria) this;
        }

        public Criteria andReplyLike(String value) {
            addCriterion("reply like", value, "reply");
            return (Criteria) this;
        }

        public Criteria andReplyNotLike(String value) {
            addCriterion("reply not like", value, "reply");
            return (Criteria) this;
        }

        public Criteria andReplyIn(List<String> values) {
            addCriterion("reply in", values, "reply");
            return (Criteria) this;
        }

        public Criteria andReplyNotIn(List<String> values) {
            addCriterion("reply not in", values, "reply");
            return (Criteria) this;
        }

        public Criteria andReplyBetween(String value1, String value2) {
            addCriterion("reply between", value1, value2, "reply");
            return (Criteria) this;
        }

        public Criteria andReplyNotBetween(String value1, String value2) {
            addCriterion("reply not between", value1, value2, "reply");
            return (Criteria) this;
        }

        public Criteria andReplytimeIsNull() {
            addCriterion("replyTime is null");
            return (Criteria) this;
        }

        public Criteria andReplytimeIsNotNull() {
            addCriterion("replyTime is not null");
            return (Criteria) this;
        }

        public Criteria andReplytimeEqualTo(String value) {
            addCriterion("replyTime =", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeNotEqualTo(String value) {
            addCriterion("replyTime <>", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeGreaterThan(String value) {
            addCriterion("replyTime >", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeGreaterThanOrEqualTo(String value) {
            addCriterion("replyTime >=", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeLessThan(String value) {
            addCriterion("replyTime <", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeLessThanOrEqualTo(String value) {
            addCriterion("replyTime <=", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeLike(String value) {
            addCriterion("replyTime like", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeNotLike(String value) {
            addCriterion("replyTime not like", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeIn(List<String> values) {
            addCriterion("replyTime in", values, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeNotIn(List<String> values) {
            addCriterion("replyTime not in", values, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeBetween(String value1, String value2) {
            addCriterion("replyTime between", value1, value2, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeNotBetween(String value1, String value2) {
            addCriterion("replyTime not between", value1, value2, "replytime");
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