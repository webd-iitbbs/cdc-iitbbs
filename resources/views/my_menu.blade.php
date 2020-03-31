
<ul style="list-style-type: none;">
    @foreach($items as $menu_item)
        <li style="float: left;text-align: center;display: block;padding:8px;"><a href="{{ $menu_item->link() }}">{{ $menu_item->title }}</a></li>
    @endforeach
</ul>