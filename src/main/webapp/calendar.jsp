<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="tn.iit.projetjee.entity.User" %>
<html>
<head>
    <title>Calendrier</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .logo-img {
            height: 3rem;
            position: relative;
            align-items: center;
        }
        .navbar-vertical {
            position: fixed;
            height: 100%;
            width: 250px;
            background-color: #343a40;
            color: white;
        }
        .nav-item {
            color: white;
        }
        .nav-item a {
            color: white !important;
            text-decoration: none;
        }
        #page-content {
            margin-left: 250px;
            padding: 20px;
        }
        .calander {
            width: 100%;
        }
        .calander .top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }
        .calander .arrow {
            cursor: pointer;
        }
        .calander .container {
            display: flex;
            flex-wrap: wrap;
        }
        .calander .month {
            display: none;
            width: 100%;
        }
        .calander .month.active {
            display: table;
        }
        .calander .week {
            display: flex;
        }
        .calander .day {
            flex: 1;
            padding: 10px;
            border: 1px solid #dee2e6;
            box-sizing: border-box;
        }
        .day .DayNum {
            font-weight: bold;
        }
        .day .info {
            margin-top: 10px;
        }
        .today {
            background-color: #e9ecef;
        }
    </style>
</head>
<body>
<script src="https://kit.fontawesome.com/ab18cab0ff.js" crossorigin="anonymous"></script>

<!-- Sidebar -->
<nav class="navbar-vertical navbar" style="color:black;">
    <%
        User userr = (User) session.getAttribute("user");
    %>
    <div class="vh-100" data-simplebar>
        <a class="navbar-brand" href="HomeServlet" style="color: white">
            <h5>Printer management IIT</h5>
        </a>
        <ul class="navbar-nav flex-column" id="sideNavbar">
            <% if (userr.getRole().equals("admin")) { %>
            <li class="nav-item">
                <a class="nav-link" href="admindasboard">
                    <i class="nav-icon fe fe-home me-2"></i>
                    Dashboard
                </a>
            </li>
            <!-- Other admin links -->
            <% } %>
            <% if (userr.getRole().equals("enseignant")) { %>
            <li class="nav-item">
                <a class="nav-link" href="usermatiere">
                    <span>
                        <i class="icon icon-tabler icons-tabler-outline icon-tabler-select"></i>
                    </span>
                    <span class="ms-2">Select Matieres</span>
                </a>
            </li>
            <!-- Other enseignant links -->
            <% } %>
            <% if (userr.getRole().equals("agent")) { %>
            <li class="nav-item">
                <a class="nav-link" href="AgentImpression">
                    <span>
                        <i class="icon icon-tabler icons-tabler-outline icon-tabler-printer"></i>
                    </span>
                    <span class="ms-2">Liste des Impressions</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AgentCalendarServlet">
                    <span>
                        <i class="icon icon-tabler icons-tabler-outline icon-tabler-calendar-week"></i>
                    </span>
                    <span class="ms-2">Calendrier</span>
                </a>
            </li>
            <li class="nav-item">
                <div class="nav-divider"></div>
            </li>
            <% } %>
        </ul>
    </div>
</nav>

<!-- Page Content -->
<main id="page-content">
    <header class="p-3">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-between">
                <div class="d-flex align-items-center">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                        <div class="avatar avatar-md avatar-indicators avatar-online">
                            <img alt="avatar" src="${pageContext.request.contextPath}/assets/avatar.png" class="rounded-circle" width="50px" height="50px" />
                        </div>
                    </a>
                    <ul class="nav col-12 col-lg-auto mb-2 mb-lg-0 ms-3">
                        <li class="nav-item">
                            <%
                                User user = (User) session.getAttribute("user");
                            %>
                            <span class="nav-link text-black" style="color: black">
                                <%= user.getEmail() %>
                            </span>
                        </li>
                    </ul>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-end">
                        <a href="LogoutServlet"><button type="button" class="btn btn-warning">Log out</button></a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <section class="container-fluid p-4">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-12">
                <div class="border-bottom pb-3 mb-3 d-md-flex align-items-center justify-content-between">
                    <div class="mb-3 mb-md-0">
                        <h1 class="mb-1 h2 fw-bold">Calendrier</h1>
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
                <div class="calander">
                    <div class="top">
                        <div class="arrow left" onclick="turnLeft();"><i class="fas fa-arrow-left"></i></div>
                        <div class="font"></div>
                        <div class="arrow right" onclick="turnRight();"><i class="fas fa-arrow-right"></i></div>
                    </div>
                    <div class="container"></div>
                </div>
            </div>
        </div>
    </section>
</main>

<script>
    var events = {
        'November': {
            'days': {
                '20': {
                    'events': [
                        { 'type': 'event', 'time': '8am - 9am', 'name': 'recruit', 'info': 'come see us!' },
                        { 'type': 'test', 'time': '-8am - 9am', 'name': 'blahrecruit', 'info': 'ok come see us!' }
                    ]
                }
            }
        },
        'February': {
            'days': {
                '20': {
                    'events': [
                        { 'type': 'event', 'time': '8am - 9am', 'name': 'recruit', 'info': 'come see us!' },
                        { 'type': 'test', 'time': '-8am - 9am', 'name': 'blahrecruit', 'info': 'ok come see us!' }
                    ]
                }
            }
        }
    };

    var DateTime = function () {
        if (arguments.length == 0) {
            this.date = new Date();
        } else {
            try {
                if (arguments.length == 1 && (typeof arguments[0] == "string" || typeof arguments[0] == "number")) {
                    this.date = new Date(arguments[0]);
                } else if (arguments.length > 1) {
                    switch (arguments.length) {
                        case 2: this.date = new Date(arguments[0], arguments[1]); break;
                        case 3: this.date = new Date(arguments[0], arguments[1], arguments[2]); break;
                        case 4: this.date = new Date(arguments[0], arguments[1], arguments[2], arguments[3]); break;
                        case 5: this.date = new Date(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]); break;
                        case 6: this.date = new Date(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]); break;
                        case 7: this.date = new Date(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6]); break;
                        default: this.date = new Date(); break;
                    };
                } else {
                    this.date = new Date();
                };
            } catch (ex) {
                console.log("ERROR: Creating DateTime Object: \r\n", ex);
                this.date = new Date();
            };
        };
        if (this.date == "Invalid Date") this.date = new Date();

        this.getDaySuffix = function (a) {
            var b = "" + a, c = b.length, d = parseInt(b.substring(c - 2, c - 1)), e = parseInt(b.substring(c - 1));
            if (c == 2 && d == 1) return "th";
            switch (e) {
                case 1: return "st"; break;
                case 2: return "nd"; break;
                case 3: return "rd"; break;
                default: return "th"; break;
            };
        };

        this.getDoY = function (a) {
            var b = new Date(a.getFullYear(), 0, 1);
            return Math.ceil((a - b) / 86400000);
        }

        this.weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        this.months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

        this.day = {
            index: { week: "0" + this.date.getDay(), month: (this.date.getDate() < 10) ? "0" + this.date.getDate() : this.date.getDate() },
            name: this.weekdays[this.date.getDay()],
            of: {
                week: ((this.date.getDay() < 10) ? "0" + this.date.getDay() : this.date.getDay()) + this.getDaySuffix(this.date.getDay()),
                month: ((this.date.getDate() < 10) ? "0" + this.date.getDate() : this.date.getDate()) + this.getDaySuffix(this.date.getDate())
            }
        }

        this.month = {
            index: (this.date.getMonth() + 1) < 10 ? "0" + (this.date.getMonth() + 1) : this.date.getMonth() + 1,
            name: this.months[this.date.getMonth()]
        };

        this.year = this.date.getFullYear();

        this.time = {
            hour: {
                meridiem: (this.date.getHours() > 12) ? (this.date.getHours() - 12) < 10 ? "0" + (this.date.getHours() - 12) : this.date.getHours() - 12 : (this.date.getHours() < 10) ? "0" + this.date.getHours() : this.date.getHours(),
                military: (this.date.getHours() < 10) ? "0" + this.date.getHours() : this.date.getHours(),
                noLeadZero: { meridiem: (this.date.getHours() > 12) ? this.date.getHours() - 12 : this.date.getHours(), military: this.date.getHours() }
            },
            minute: (this.date.getMinutes() < 10) ? "0" + this.date.getMinutes() : this.date.getMinutes(),
            seconds: (this.date.getSeconds() < 10) ? "0" + this.date.getSeconds() : this.date.getSeconds(),
            milliseconds: (this.date.getMilliseconds() < 100) ? (this.date.getMilliseconds() < 10) ? "00" + this.date.getMilliseconds() : "0" + this.date.getMilliseconds() : this.date.getMilliseconds(),
            meridiem: (this.date.getHours() > 12) ? "PM" : "AM"
        };

        this.sym = {
            d: {
                d: this.date.getDate(), dd: (this.date.getDate() < 10) ? "0" + this.date.getDate() : this.date.getDate(), ddd: this.weekdays[this.date.getDay()] ? this.weekdays[this.date.getDay()].substring(0, 3) : null, dddd: this.weekdays[this.date.getDay()],
                ddddd: ((this.date.getDate() < 10) ? "0" + this.date.getDate() : this.date.getDate()) + this.getDaySuffix(this.date.getDate()), m: this.date.getMonth() + 1, mm: (this.date.getMonth() + 1) < 10 ? "0" + (this.date.getMonth() + 1) : this.date.getMonth() + 1,
                mmm: this.months[this.date.getMonth()] ? this.months[this.date.getMonth()].substring(0, 3) : null, mmmm: this.months[this.date.getMonth()], yy: ("" + this.date.getFullYear()).substr(2, 2), yyyy: this.date.getFullYear()
            },
            t: {
                h: (this.date.getHours() > 12) ? this.date.getHours() - 12 : this.date.getHours(), hh: (this.date.getHours() > 12) ? (this.date.getHours() - 12) < 10 ? "0" + (this.date.getHours() - 12) : this.date.getHours() - 12 : (this.date.getHours() < 10) ? "0" + this.date.getHours() : this.date.getHours(),
                hhh: this.date.getHours(), m: this.date.getMinutes(), mm: (this.date.getMinutes() < 10) ? "0" + this.date.getMinutes() : this.date.getMinutes(), s: this.date.getSeconds(), ss: (this.date.getSeconds() < 10) ? "0" + this.date.getSeconds() : this.date.getSeconds(),
                ms: this.date.getMilliseconds(), mss: Math.round(this.date.getMilliseconds() / 10) < 10 ? "0" + Math.round(this.date.getMilliseconds() / 10) : Math.round(this.date.getMilliseconds() / 10), msss: (this.date.getMilliseconds() < 100) ? (this.date.getMilliseconds() < 10) ? "00" + this.date.getMilliseconds() : "0" + this.date.getMilliseconds() : this.date.getMilliseconds()
            }
        };

        this.formats = {
            compound: {
                commonLogFormat: this.sym.d.dd + "/" + this.sym.d.mmm + "/" + this.sym.d.yyyy + ":" + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                exif: this.sym.d.yyyy + ":" + this.sym.d.mm + ":" + this.sym.d.dd + " " + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                mySQL: this.sym.d.yyyy + "-" + this.sym.d.mm + "-" + this.sym.d.dd + " " + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                postgreSQL1: this.sym.d.yyyy + "." + this.getDoY(this.date), postgreSQL2: this.sym.d.yyyy + "" + this.getDoY(this.date),
                soap: this.sym.d.yyyy + "-" + this.sym.d.mm + "-" + this.sym.d.dd + "T" + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss + "." + this.sym.t.mss,
                xmlrpc: this.sym.d.yyyy + "" + this.sym.d.mm + "" + this.sym.d.dd + "T" + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                xmlrpcCompact: this.sym.d.yyyy + "" + this.sym.d.mm + "" + this.sym.d.dd + "T" + this.sym.t.hhh + "" + this.sym.t.mm + "" + this.sym.t.ss,
                wddx: this.sym.d.yyyy + "-" + this.sym.d.m + "-" + this.sym.d.d + "T" + this.sym.t.h + ":" + this.sym.t.m + ":" + this.sym.t.s
            },
            constants: {
                atom: this.sym.d.yyyy + "-" + this.sym.d.mm + "-" + this.sym.d.dd + "T" + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                cookie: this.sym.d.dddd + ", " + this.sym.d.dd + "-" + this.sym.d.mmm + "-" + this.sym.d.yy + " " + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                iso8601: this.sym.d.yyyy + "-" + this.sym.d.mm + "-" + this.sym.d.dd + "T" + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                rfc822: this.sym.d.ddd + ", " + this.sym.d.dd + " " + this.sym.d.mmm + " " + this.sym.d.yy + " " + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                rfc850: this.sym.d.dddd + ", " + this.sym.d.dd + "-" + this.sym.d.mmm + "-" + this.sym.d.yy + " " + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                rfc1036: this.sym.d.ddd + ", " + this.sym.d.dd + " " + this.sym.d.mmm + " " + this.sym.d.yy + " " + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                rfc1123: this.sym.d.ddd + ", " + this.sym.d.dd + " " + this.sym.d.mmm + " " + this.sym.d.yyyy + " " + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                rfc2822: this.sym.d.ddd + ", " + this.sym.d.dd + " " + this.sym.d.mmm + " " + this.sym.d.yyyy + " " + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                rfc3339: this.sym.d.yyyy + "-" + this.sym.d.mm + "-" + this.sym.d.dd + "T" + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                rss: this.sym.d.ddd + ", " + this.sym.d.dd + " " + this.sym.d.mmm + " " + this.sym.d.yy + " " + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss,
                w3c: this.sym.d.yyyy + "-" + this.sym.d.mm + "-" + this.sym.d.dd + "T" + this.sym.t.hhh + ":" + this.sym.t.mm + ":" + this.sym.t.ss
            },
            pretty: {
                a: this.sym.t.h + ":" + this.sym.t.mm + "." + this.sym.t.ss + this.time.meridiem + " " + this.sym.d.dddd + " " + this.sym.d.ddddd + " of " + this.sym.d.mmmm + ", " + this.sym.d.yyyy,
                b: this.sym.t.h + ":" + this.sym.t.mm + this.time.meridiem + " " + this.sym.d.dddd + " " + this.sym.d.ddddd + " of " + this.sym.d.mmmm + ", " + this.sym.d.yyyy
            }
        };

    };

    var CurrentM = new Date().getMonth();
    var daysN = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    var monthsN = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    function daysInMonth(iMonth, iYear) {
        return 32 - new Date(iYear, iMonth, 32).getDate();
    };

    var getFD = function (cmonth) {
        var Date_Object = new Date();
        Date_Object.setMonth(cmonth);
        var first_DOW = Date_Object.getDay();
        return first_DOW;
    };

    var getFD2 = function (cmonth) {
        var temp = getFD(cmonth);
        var Date_Object = new Date();
        Date_Object.setMonth(cmonth);
        Date_Object.setDate(daysInMonth(cmonth, Date_Object.getFullYear()));
        var first_DOW = Date_Object.getDay();
        return (daysInMonth(cmonth, Date_Object.getFullYear()) + temp + 1);
    };

    var calander = document.querySelector('.calander');
    calander.container = calander.querySelector('.container');

    var week = function () {
        var temp = document.createElement('tr');
        temp.className = 'week';
        return temp;
    };

    var day = function (cmonth, tday, type) {
        var info = function () {
            this.info = document.createElement('div');
            this.info.className = 'info';
            this.header = document.createElement('div');
            this.header.className = 'title';
            this.text = document.createElement('div');
            this.text.className = '2info';
            return this;
        };

        var cmonth = cmonth;
        var cday = (((i * 7) + (j + 1)) - tday);
        var div = document.createElement('div');
        div.className = 'Daycont';
        var num = document.createElement('div');
        var temp = document.createElement('td');
        temp.name = document.createElement('div');
        temp.appendChild(div);
        num.className = 'DayNum';
        temp.name.className = 'DayName';

        if (type == true) {
            temp.className = 'day Nday';
        } else {
            var tempday = new Date();
            if ((new Date().getDate()) == (((i * 7) + (j + 1)) - tday) && (new Date().getMonth()) == cmonth) {
                temp.className = 'day Oday today';
            } else {
                temp.className = 'day Oday';
            }

            num.innerHTML = cday;
            div.appendChild(num);
            div.appendChild(temp.name);

            if (events[monthsN[cmonth].toString()]) {
                if (events[monthsN[cmonth].toString()].days[cday.toString()]) {
                    for (var a in events[monthsN[cmonth].toString()].days[cday.toString()].events) {
                        var tempdiv = new info();
                        tempdiv.header.innerHTML += events[monthsN[cmonth].toString()].days[cday.toString()].events[a].name;
                        tempdiv.text.innerHTML += events[monthsN[cmonth].toString()].days[cday.toString()].events[a].time + "\n";
                        tempdiv.text.innerHTML += events[monthsN[cmonth].toString()].days[cday.toString()].events[a].info;
                        div.appendChild(tempdiv.info);
                        tempdiv.info.appendChild(tempdiv.header);
                        tempdiv.info.appendChild(tempdiv.text);
                    }
                }
            }
        }

        return temp;
    };

    var month = function () {
        var temp = document.createElement('table');
        var temp2 = document.createElement('tbody');
        temp.appendChild(temp2);
        temp.className = 'month';
        return temp;
    };

    for (var q = 0; q < 12; q++) {
        var months = new month();
        var cmonth = q;
        calander.querySelector('.container').appendChild(months);

        for (var i = 0; i < 6; i++) {
            var weeks = new week();
            calander.querySelector('.container').children[calander.querySelector('.container').children.length - 1].children[0].appendChild(weeks);

            for (var j = 0; j < 7; j++) {
                if (((getFD(q) + 1) > j && i == 0)) {
                    var days = new day(q, 0, true);
                } else if (((getFD2(q)) < ((i * 7) + (j + 1)) && i > 3)) {
                    var days = new day(q, 0, true);
                } else {
                    var days = new day(q, (getFD(q) + 1), false);
                    days.name.innerHTML = daysN[j];
                }

                weeks.appendChild(days);
            }
        }
    }

    var turnRight = function () {
        if (CurrentM < 11) {
            calander.container.children[CurrentM].style.display = 'none';
            CurrentM++;
            calander.querySelector('.top').children[1].innerHTML = monthsN[CurrentM];
            calander.container.children[CurrentM].style.display = 'table';
        }
    }

    var turnLeft = function () {
        if (CurrentM > 0) {
            calander.container.children[CurrentM].style.display = 'none';
            CurrentM--;
            calander.querySelector('.top').children[1].innerHTML = monthsN[CurrentM];
            calander.container.children[CurrentM].style.display = 'table';
        }
    }

    calander.querySelector('.top').children[1].innerHTML = monthsN[new Date().getMonth()];
    calander.container.children[new Date().getMonth()].style.display = 'table';
</script>

</body>
</html>
