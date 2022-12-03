# Requirements

Needs to hold a bunch of info on what event_days Ss are going, times and which school
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
- has_many :event_children, through: :events, through: :event_days, source: etc. etc.

## User
### Attributes
- name STRING
- devise stuff
- phone STRING
- role INT [:caregiver, :manager, :admin]
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
- has_many :event_days, through: registrations
- has_many :emergency_contacts


## Registration
### Attributes
- child_id FOREIGN_KEY
- event_id FOREIGN_KEY
- attend_afternoon BOOLEAN
- attend_morning BOOLEANf

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
- has_many :event_days


## Event_day
### Attributes
- date DATE
- fee DECIMAL
- morning_description STRING
- afternoon_description STRING

### Validations
- 

### Associations
- belongs_to :event
- has_many :registrations
- has_many :children, through: registrations


## Emergency Contacts
### Attributes
- name STRING
- relationship STRING
- phone STRING
- child FOREIGN_KEY

### Validations
- 

### Associations
- belongs_to :child