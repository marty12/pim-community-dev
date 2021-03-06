@javascript
Feature: Browse products by locale and scope
  In order to enrich my catalog
  As a regular user
  I need to be able to browse products data by locale and scope

  Background:
    Given the "default" catalog configuration
    And the following family:
      | code      |
      | furniture |
    And the following attributes:
      | label       | localizable | scopable |
      | name        | yes         | no       |
      | image       | no          | yes      |
      | description | yes         | yes      |
    And the following product:
      | sku    | family    | name-en_US | name-fr_FR | description-en_US-ecommerce | description-fr_FR-ecommerce | description-fr_FR-mobile | image-ecommerce | image-mobile |
      | postit | furniture | Post it    | Etiquette  | My ecommerce description    | Ma description ecommerce    | Ma description mobile    | large.jpeg      | small.jpeg   |
    And I am logged in as "Mary"
    And I am on the products page
    And I display the columns SKU, Name, Image, Description and Family

  @skip
  Scenario: Successfully display english data on products page
    Given I switch the locale to "en_US"
    Then I should see product postit
    And I switch the scope to "E-commerce"
    Then the row "postit" should contain:
      | column      | value                    |
      | SKU         | postit                   |
      | name        | Post it                  |
      | image       | large.jpeg               |
      | description | My ecommerce description |
      | family      | [furniture]              |
    When I switch the scope to "Mobile"
    Then the row "postit" should contain:
      | column      | value       |
      | SKU         | postit      |
      | name        | Post it     |
      | image       | small.jpeg  |
      | description |             |
      | family      | [furniture] |

  @skip
  Scenario: Successfully display french data on products page
    Given I switch the locale to "fr_FR"
    Then I should see product postit
    When I switch the scope to "E-commerce"
    Then the row "postit" should contain:
      | column        | value                    |
      | SKU           | postit                   |
      | [name]        | Etiquette                |
      | [image]       | large.jpeg               |
      | [description] | Ma description ecommerce |
      | family        | [furniture]              |
    When I switch the scope to "Mobile"
    Then the row "postit" should contain:
      | column        | value                 |
      | SKU           | postit                |
      | [name]        | Etiquette             |
      | [image]       | small.jpeg            |
      | [description] | Ma description mobile |
      | family        | [furniture]           |
