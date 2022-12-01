# Requirements

Needs to hold a bunch of info on what days Ss are going, times and which school
SMs need to see (and SM of school they're visiting if that happens)
Need to be able to edit, but prob only one S at a time
Want hosting, currently on AWS, looking at Firebase

# Database Schema
[Visual schema here](https://lucid.app/lucidchart/582c392f-7113-4fb7-9a93-8697af8fa27d/edit?invitationId=inv_4ec19f91-a432-4b99-a0d2-09d50b682b5f)

## School
### Attributes
- name STRING
- address STRING
- phone STRING

### Validations
- 

### Associations
- has_many :users
- has_many :events
- has_many :children, through: :users
- has_many :event_children, through: :events, source: etc. etc.

## User
### Attributes
- name STRING
- devise stuff
- phone STRING
- role INT [:parent, :manager, :admin]
- school FOREIGN_KEY

### Validations
- 

### Associations
- belongs_to :school
- has_many :children


## Child
### Attributes
- name STRING
- birthday DATE
- level STRING
- allergies STRING 

### Validations
- 

### Associations
- belongs_to :parent
- has_many :events, through: registrations
- has_many :days, through: :events


## Registration
### Attributes
- child_id FOREIGN_KEY
- event_id FOREIGN_KEY

### Validations
- 

### Associations
- belongs_to :child
- belongs_to :event

## Event
### Attributes
- title STRING
- description STRING
- start_date DATE
- end_date DATE

### Validations
- 

### Associations
- belongs_to :school
- has_many :days
- has_many :children, through: registrations


## Day
### Attributes
- date DATE
- fee DECIMAL
- attend_morning BOOLEAN
- morning_description STRING
- attend_afternoon BOOLEAN
- afternoon_description STRING

### Validations
- 

### Associations
- belongs_to :event
- has_many :children, through: :event