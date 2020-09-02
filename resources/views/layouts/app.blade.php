<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'CDC IITBBS') }}</title>
    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}"  ></script>

    <!-- Fonts -->
    <link rel="shortcut icon" href="{{ URL::to('/') }}/images/favicon.ico">
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <!-- Styles -->
    
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{ URL::to('/') }}/css/style.css">
    @yield('css')
    
</head>
<body>
    <div id="app" style="background:white;">
        <header>
			<div class="container-fluid">
				<div class="header d-lg-flex justify-content-between align-items-center py-3 px-sm-3">
					<!-- logo -->
					<div id="logo">
						<h1><a href="/"><img class="img-fluid" style="max-height:113px;" src="{{ URL::to('/') }}/images/header.png"></a></h1>
					</div>
					<!-- logo -->
					<!-- nav -->
					<div class="nav_w3ls">
						<nav>
							<label for="drop" class="toggle">Menu</label>
							<input type="checkbox" id="drop" />
							<ul class="menu">
                                <li><a href="/forums" class="{{ Request::is('forums') ? 'active' : '' }}">Forums</a></li>
								<li><a href="/home" class="{{ Request::is('home') ? 'active' : '' }}">Home</a></li>
								<li><a href="/internship" class="{{ Request::is('internship') ? 'active' : '' }}">internship</a></li>
								<li><a href="/placement" class="{{ Request::is('placement') ? 'active' : '' }}">Placement</a></li>
                            @guest
                            <li class="nav-item">
                                <a class="nav-link" href="{{ url('/redirect') }}" class="btn "><i class="fa fa-google" aria-hidden="true"></i> &nbsp; Login With Google</a>
                            </li>
                            @if (Route::has('register'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                </li>
                            @endif
                        @else
                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                    <a class="dropdown-item" href="/user/profile">My Profile </a>

                                </div>
                            </li>
                        @endguest
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</header>


        <main class="py-4" style="background-color: white;">
            @yield('content')
        </main>
        <div class="copy-bottom bg-li py-4 border-top">
		<div class="container-fluid">
			<div class="d-md-flex px-md-3 position-relative text-center">
				<!-- copyright -->
				<div class="copy_right mx-md-auto mb-md-0 mb-3">
					<p class="text-bl let">© Developed by Web and Design Society, IIT Bhubaneswar.</p>
				</div>
				<!-- //copyright -->
			</div>
		</div>
	</div>
        @yield('js')
    </div>
    
</body>
</html>
