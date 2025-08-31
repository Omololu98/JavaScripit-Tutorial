@Query(
    value = """
        SELECT 
            au.email AS clientEmail,
            u.first_name AS clientFirstname,
            u.last_name AS clientLastname,
            CASE 
                WHEN b.service_type = 'FACILITY' 
                    THEN (SELECT f.name FROM facility f WHERE f.id = b.service_item_id)
                WHEN b.service_type = 'APPOINTMENT' 
                    THEN (SELECT a.appointment_name FROM appointment a WHERE a.id = b.service_item_id)
                WHEN b.service_type = 'FITNESS_CLASS' 
                    THEN (SELECT fc.name FROM fitness_class fc WHERE fc.id = b.service_item_id)
                WHEN b.service_type = 'MEMBERSHIP' 
                    THEN (SELECT m.membership_name FROM membership m WHERE m.id = b.service_item_id)
                WHEN b.service_type = 'PACKAGE' 
                    THEN (SELECT p.package_name FROM package p WHERE p.id = b.service_item_id)
                ELSE 'Unknown Service'
            END AS productName,
            CASE
                WHEN b.service_type = 'MEMBERSHIP'
                    THEN (select m.registration_fee FROM membership m WHERE m.id = b.service_item_id)
                ELSE 0.00
            END AS registrationFee,
            b.service_type AS productType,
            b.amount AS amount,
            b.charges AS charges,
            bh.id AS transactionId,
            bh.transaction_reference AS transactionReference,
            bh.payment_reference AS paymentReference,
            bh.payment_status AS paymentStatus,
            bh.payment_method AS paymentMethod,
            DATE_FORMAT(bh.created_at, '%Y-%m-%d %H:%i:%s') AS timestamp,
            b.action_by AS actionBy
        FROM booking_histories bh
        JOIN bookings b ON bh.booking_id = b.id
        JOIN user u ON b.client_id = u.id
        JOIN app_users au ON u.id = au.id
        WHERE 1=1
          AND b.business_id = :businessId
          AND (:paymentStatus IS NULL OR bh.payment_status = :paymentStatus)
          AND (:paymentGateway IS NULL OR bh.payment_method = :paymentGateway)
          AND (:fromDate IS NULL OR bh.created_at >= :fromDate)
          AND (:toDate IS NULL OR bh.created_at <= :toDate)
          AND (
              :searchTerm IS NULL OR :searchTerm = '' OR
              LOWER(u.first_name) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR
              LOWER(u.last_name) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR
              LOWER(au.email) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR
              LOWER(bh.transaction_reference) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR
              LOWER(bh.payment_reference) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR
              CAST(b.amount AS CHAR) LIKE CONCAT('%', :searchTerm, '%') OR
              LOWER(
                  CASE
                      WHEN b.service_type = 'FACILITY' 
                          THEN (SELECT f.name FROM facility f WHERE f.id = b.service_item_id)
                      WHEN b.service_type = 'APPOINTMENT' 
                          THEN (SELECT a.appointment_name FROM appointment a WHERE a.id = b.service_item_id)
                      WHEN b.service_type = 'FITNESS_CLASS' 
                          THEN (SELECT fc.name FROM fitness_class fc WHERE fc.id = b.service_item_id)
                      WHEN b.service_type = 'MEMBERSHIP' 
                          THEN (SELECT m.membership_name FROM membership m WHERE m.id = b.service_item_id)
                      WHEN b.service_type = 'PACKAGE' 
                          THEN (SELECT p.package_name FROM package p WHERE p.id = b.service_item_id)
                      ELSE 'Unknown Service'
                  END
              ) LIKE LOWER(CONCAT('%', :searchTerm, '%'))
          )
        ORDER BY bh.created_at DESC
        """,
    countQuery = """
        SELECT COUNT(*)
        FROM booking_histories bh
        JOIN bookings b ON bh.booking_id = b.id
        JOIN user u ON b.client_id = u.id
        JOIN app_users au ON u.id = au.id
        WHERE 1=1
          AND b.business_id = :businessId
          AND (:paymentStatus IS NULL OR bh.payment_status = :paymentStatus)
          AND (:paymentGateway IS NULL OR bh.payment_method = :paymentGateway)
          AND (:fromDate IS NULL OR bh.created_at >= :fromDate)
          AND (:toDate IS NULL OR bh.created_at <= :toDate)
          AND (
              :searchTerm IS NULL OR :searchTerm = '' OR
              LOWER(u.first_name) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR
              LOWER(u.last_name) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR
              LOWER(au.email) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR
              LOWER(bh.transaction_reference) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR
              LOWER(bh.payment_reference) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR
              CAST(b.amount AS CHAR) LIKE CONCAT('%', :searchTerm, '%') OR
              LOWER(
                  CASE
                      WHEN b.service_type = 'FACILITY' 
                          THEN (SELECT f.name FROM facility f WHERE f.id = b.service_item_id)
                      WHEN b.service_type = 'APPOINTMENT' 
                          THEN (SELECT a.appointment_name FROM appointment a WHERE a.id = b.service_item_id)
                      WHEN b.service_type = 'FITNESS_CLASS' 
                          THEN (SELECT fc.name FROM fitness_class fc WHERE fc.id = b.service_item_id)
                      WHEN b.service_type = 'MEMBERSHIP' 
                          THEN (SELECT m.membership_name FROM membership m WHERE m.id = b.service_item_id)
                      WHEN b.service_type = 'PACKAGE' 
                          THEN (SELECT p.package_name FROM package p WHERE p.id = b.service_item_id)
                      ELSE 'Unknown Service'
                  END
              ) LIKE LOWER(CONCAT('%', :searchTerm, '%'))
          )
        """,
    nativeQuery = true
)
