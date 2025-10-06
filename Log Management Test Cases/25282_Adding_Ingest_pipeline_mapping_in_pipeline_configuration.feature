Feature: 25282 Adding Ingest Pipeline Mapping in Pipeline Configuration

    Background:
        Given the user is logged in
        And the user navigates to “Pipeline Configuration”

    # ---------- Uploading a NEW pipeline ----------
    @25282_Adding_Ingest_Pipeline_Mapping
    Scenario: Upload a new pipeline – verify restart and navigation
        When the user uploads a new pipeline
        Then the pipeline uploads successfully
        And the Log Collector restarts successfully
        And the application navigates to “Log Search”

    # ---------- Redis module ----------
    @25282_Adding_Ingest_Pipeline_Mapping
    Scenario: Validate Redis module fields
        Given logs are received from the Redis module
        Then each event contains
            | process.pid    |
            | redis.log.role |
            | log.level      |
            | message        |
            | error.message  |
        And the field error.message is  empty

    # ---------- RabbitMQ module ----------
    @25282_Adding_Ingest_Pipeline_Mapping
    Scenario: Validate RabbitMQ module fields
        Given logs are received from the RabbitMQ module
        Then each event contains
            | timestamp        |
            | log.level        |
            | rabbitmq.log.pid |
            | message          |
            | user.name        |
            | event.action     |
            | error.message    |
        And the field error.message is  empty

    # ---------- NGINX module – error fileset ----------
    @25282_Adding_Ingest_Pipeline_Mapping
    Scenario: Validate NGINX error fileset fields
        Given logs are received from the NGINX module “error” fileset
        Then each event contains
            | log.level                 |
            | process.pid               |
            | process.thread.id         |
            | nginx.error.connection_id |
            | message                   |
            | error.message             |
        And the field error.message is  empty

    # ---------- NGINX module – access fileset ----------
    @25282_Adding_Ingest_Pipeline_Mapping
    Scenario: Validate NGINX access fileset fields
        Given logs are received from the NGINX module “access” fileset
        Then each event contains
            | http.request.method         |
            | http.request.referrer       |
            | http.response.body.bytes    |
            | http.response.status_code   |
            | http.version                |
            | nginx.access.remote_ip_list |
            | source.address              |
            | source.ip                   |
            | user_agent.original         |
            | error.message               |
        And the field error.message is  empty

    # ---------- Kafka module ----------
    @25282_Adding_Ingest_Pipeline_Mapping
    Scenario: Validate Kafka module fields
        Given logs are received from the Kafka module
        Then each event contains
            | kafka.log.class         |
            | kafka.log.component     |
            | kafka.log.trace.class   |
            | kafka.log.trace.message |
            | log.level               |
            | message                 |
            | error.message           |
        And the field error.message is  empty

    # ---------- Other logs ----------
    @25282_Adding_Ingest_Pipeline_Mapping
    Scenario: Validate untouched logs remain unchanged
        Given other log sources are ingested
        Then their events remain in their usual state without unintended field changes
        And if error.message exists, it is  empty
