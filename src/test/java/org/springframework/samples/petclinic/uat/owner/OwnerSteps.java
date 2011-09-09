package org.springframework.samples.petclinic.uat.owner;

import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;

/**
 * Created by IntelliJ IDEA.
 * User: reaapi
 * Date: 9/9/11
 * Time: 9:55 AM
 * To change this template use File | Settings | File Templates.
 */
public class OwnerSteps {
    static Map<String, String> urlMapping = new HashMap<String, String>();

    static {
        urlMapping.put("adding owner", "/owners/new");
    }

    private String host = "http://localhost:8080";

    private String appName = "petclinic";

    private String getPageUrl(String pageName) {
        return new StringBuilder(host).append('/').append(appName).append(urlMapping.get(pageName)).toString();
    }

    private WebDriver driver = new FirefoxDriver();

    @Given("I am on page $pageName")
    public void iAmOnPage(String pageName) {
        String pageUrl = getPageUrl(pageName);
        System.out.print("pageUrl: " + pageUrl);
        driver.get(pageUrl);
    }

    @When("I filled $field with $value")
    public void iFilledField(String field, String value) {
        driver.findElement(By.name(field)).sendKeys(value);
    }

    @When("I submit")
    public void iSubmit() {
        driver.findElement(By.xpath("//input[@type='submit']")).click();
    }

    @Then("I should see $string")
    public void iShouldSee(String string) {
        assertTrue(driver.getPageSource().contains(string));
    }

}
