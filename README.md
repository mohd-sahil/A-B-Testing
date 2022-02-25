# A/B-Testing-with-SQL



### Concept of A/B Testing

A/B testing refers to a process of experimentation, wherein two or more versions of a variable like web page, page element, etc. are shown to different segments of users at the same time to determine which version leaves the maximum impact and drive business metrics.

<img src = "images/Screenshot 2022-02-13 165748.png" width = "650">

In A/B testing, A refers to ‘control’ or the original testing variable. Whereas B refers to ‘variation’ or a new version of the original testing variable.

<img src = "images/Screenshot 2022-02-14 102432.png" width = "400">

We can perform the A/B test on the following:
   * Site Pages, Flow, and Elements
   * Business Model
   * Backend Functionality and Algorithms
   * New Products or Services

The benefits of using A/B tests are as follows:

  * Increase Revenue and Conversions
  * Rapid Iteration
  * Learn what works
  * Uses Actual Site Visitors
  * Data-Driven Decision Making




### Conclusion

**Testing at Items Level**

For View Item Metric
  * The test group 1 had 2.3 % more viewed items compared to test group 0
  * p-value for this lift is 0.25, which does not meet our threshold for significance
  * There is no statistically significant change to the View Item metric as a result of the treatment
<img src = "images/view-item-mtrc (items lvl).png" width = "650">

For Order Binary Metric
  * In this case, p-value of 0.93 is observed
  * And the lift after treatment is - 0.5 %
  * There is no statiscally significant change to the Order binary metric
<img src = "images/order-mtrc (items lvl).png" width = "650">
