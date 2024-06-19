# Airline Reservation System

Welcome to the Airline Reservation System (ARS)! This project is a console-based application that allows users to register, log in, and book airline tickets. The admin can also manage the reservations and view passenger details.

## Features

- User Registration and Login
- Booking Airline Tickets
- Viewing Flight Information
- Checking Booking Status
- Editing User Profile
- Canceling Bookings
- Admin Functionality for Viewing All Bookings

## Technologies Used

- Python
- MySQL
- Tabulate (for formatted console output)

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Python 3.x installed on your machine.
- MySQL installed and running.
- Python packages: `mysql-connector-python` and `tabulate`.

## Installation and Setup

1. **Clone the Repository:**

    ```sh
    git clone https://github.com/yourusername/airline-reservation-system.git
    cd airline-reservation-system
    ```

2. **Install Required Packages:**

    ```sh
    pip install mysql-connector-python tabulate
    ```

3. **Set Up the Database:**

    - Create a database named `ars` in MySQL.
    - Use the provided `ARS.sql` file to set up the necessary tables and data.

    ```sh
    mysql -u root -p ars < ARS.sql
    ```

4. **Update Database Credentials:**

    - Edit the `ARS_FINAL.py` file to update the database connection credentials.

    ```python
    myobj = mysql.connector.connect(
        host="localhost",
        user="root",
        passwd="yourpassword",
        database="ars"
    )
    ```

5. **Run the Application:**

    ```sh
    python ARS_FINAL.py
    ```

## Usage

1. **Login or Register:**
    - Choose to either log in or register a new user account.
    
2. **Book a Ticket:**
    - Enter the number of passengers, their details, and the destination to book a ticket.

3. **View Flight Information:**
    - Check available flights and their details.

4. **Check Booking Status:**
    - View the status of your bookings.

5. **Edit Profile:**
    - Update your user profile details.

6. **Cancel Booking:**
    - Cancel one or all bookings.

7. **Admin:**
    - Log in with the admin credentials to view all bookings for a specific flight.

## License

This project is licensed under the MIT License.

## Acknowledgements

- Inspired by various airline reservation systems.
- Thanks to all contributors and open-source libraries.
