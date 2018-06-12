package edu.eurasia.untils;

/**
 * @author:Yang
 * @date:2018/6/6
 */
public class PageUtils {
    /**
     * 页数
     */
    private Integer currentIndex;
    /**
     * 每页显示数
     */
    private Integer limitIndex;

    public Integer getCurrentIndex() {
        return currentIndex;
    }

    public void setCurrentIndex(Integer currentIndex) {
        this.currentIndex = currentIndex;
    }

    public Integer getLimitIndex() {
        return limitIndex;
    }

    public void setLimitIndex(Integer limitIndex) {
        this.limitIndex = limitIndex;
    }
}
