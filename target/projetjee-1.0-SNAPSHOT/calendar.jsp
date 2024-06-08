<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Calendrier</title>
</head>
<body>
<div id="db-wrapper">
    <!-- navbar vertical -->


    <!-- navbar vertical -->
    <!-- Sidebar -->
    <%@ include file="admin-sidebar.jsp" %>


    <!-- Page Content -->
    <main id="page-content">
        <div class="header">
            <!-- navbar -->

            <%@ include file="admin-header.jsp" %>
        </div>

        <!-- Container fluid -->
        <section class="container-fluid p-4">
            <div class="row">
                <!-- Page header -->
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="border-bottom pb-3 mb-3 d-md-flex align-items-center justify-content-between">
                        <div class="mb-3 mb-md-0">
                            <h1 class="mb-1 h2 fw-bold">Calendrier</h1>
                            <!-- Breadcrumb -->
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="admin-dashboard.html">Dashboard</a>
                                    </li>

                                    <li class="breadcrumb-item active" aria-current="page">Calendrier</li>
                                </ol>
                            </nav>
                        </div>
                        <div>
                            <a href="AgentImpression" class="btn btn-outline-secondary">Impressions</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-12">

                    <!-- Calendar -->
                    <div id="calendar"></div>


                </div>
            </div>
        </section>
    </main>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');


        var eventsJson = ${eventsJson};

        console.log(eventsJson);

        var calendar = new FullCalendar.Calendar(calendarEl, {
            events: eventsJson,
            eventContent: function(info) {
                return {
                    html: '<div class="event-content">' +
                        '<div class="event-title">' + info.event.title + '</div>' +

                        '</div>'
                };
            }
        });

        calendar.render();
    });
</script>

<style>
    .event-content {
        background-color: #f0f0f0;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 5px;
        margin-bottom: 5px;
    }

    .event-title {
        font-weight: bold;
        color: #333;
        font-size: 10px;
        word-wrap: break-word; /* Allow text to wrap */
        white-space: normal; /* Allow text to wrap */
    }




    @media (max-width: 30px) {
        .event-title {
            font-size: 14px;
        }
        .event-date {
            font-size: 12px;
        }
    }

</style>
</body>
</html>
