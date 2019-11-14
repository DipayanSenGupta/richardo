<?php

namespace App\Http\Controllers;

use App\EventMenu;
use App\Menu;
use App\CacheItem;
use App\Item;
use App\EventMenuItem;

use Illuminate\Http\Request;

class EventMenuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $menus = Menu::pluck('name', 'id');

        return view('eventMenus.create')
            ->with(compact('menus'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $eventMenu = new EventMenu();
        $eventMenu->type = $request->type;
        $eventMenu->venue = $request->venue;
        $eventMenu->name = $request->event_name;
        $eventMenu->attendences = $request->attendences;
        $eventMenu->booking_time = $request->booking_time;
        $eventMenu->event_time = $request->event_time;
        $eventMenu->save(); 
        $items = CacheItem::all();

        foreach($items as $item){
            $eventMenuItem = new EventMenuItem();
            $eventMenuItem->name = $item->name;
            $eventMenu->items()->save($eventMenuItem);
        }
        \DB::table('cache_items')->truncate();
        $menus = Menu::pluck('name', 'id');

        return view('eventMenus.create')
            ->with(compact('menus'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\EventMenu  $eventMenu
     * @return \Illuminate\Http\Response
     */
    public function show(EventMenu $eventMenu)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\EventMenu  $eventMenu
     * @return \Illuminate\Http\Response
     */
    public function edit(EventMenu $eventMenu)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\EventMenu  $eventMenu
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, EventMenu $eventMenu)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\EventMenu  $eventMenu
     * @return \Illuminate\Http\Response
     */
    public function destroy(EventMenu $eventMenu)
    {
        //
    }
    public function action(Request $request){
        $items = null;
        $newMenuId = null;
        $newMenuName = null;
        $addedItems = null;
   
        if($request->add && $request->menu_id ){
            $menu_id = $request->menu_id;
            $add_id = $request->add;
            $item = Item::find($add_id);
            $newItemToMenu = new CacheItem();
            $newItemToMenu->name = $item->name;
            $newItemToMenu->save();
            $items = Menu::find($menu_id)->items;
            if(CacheItem::all()){
                $addedItems = CacheItem::all();
            }
            $cacheItemsFetch = CacheItem::pluck('name');
            $items = $items->diff(Item::whereIn('name',$cacheItemsFetch)->get());
        }
        elseif($request->delete && $request->menu_id ){
            $menu_id = $request->menu_id;
            $delete_id = $request->delete;
            $cacheitem = CacheItem::find($delete_id);
            $cacheitem->delete();

            $items = Menu::find($menu_id)->items;
            if(CacheItem::all()){
                $addedItems = CacheItem::all();
            }
            $cacheItemsFetch = CacheItem::pluck('name');
            $items = $items->diff(Item::whereIn('name',$cacheItemsFetch)->get());
        }
        elseif($request->add_extra_item && $request->menu_id){
            $menu_id = $request->menu_id;
            $add_extra_item = $request->add_extra_item;
            $newItemToMenu = new CacheItem();
            $newItemToMenu->name = $add_extra_item;
            $newItemToMenu->save();
            $items = Menu::find($menu_id)->items;
            if(CacheItem::all()){
                $addedItems = CacheItem::all();
            }
            $cacheItemsFetch = CacheItem::pluck('name');
            $items = $items->diff(Item::whereIn('name',$cacheItemsFetch)->get());
        }
        else if ($request->menu_id) {
            $menu_id = $request->menu_id;
            $items = Menu::find($menu_id)->items;
            if(CacheItem::all()){
                $addedItems = CacheItem::all();
            }
            $cacheItemsFetch = CacheItem::pluck('name');
            $items = $items->diff(Item::whereIn('name',$cacheItemsFetch)->get());
        }
        if($items){
            foreach ($items as $item) {
                $items .=    '<tr id="item' . $item->id . ' class="active">
            <td>' . $item->id . '</td>
            <td>' . $item->name . '</td>
            <td width="35%">
            <button
            class="btn btn-primary" id = "addItem" value=' . $item->id . '>Add</button>
            </td>
          </tr>';
            }
        }
        else{
            $items .= '<tr id="item' .' class="active">
            <td> No item to show' .'</td>
          </tr>';
        }
        if($addedItems){
            foreach ($addedItems as $item) {
                $addedItems .=    '<tr id="item' . $item->id . ' class="active">
            <td>' . $item->id . '</td>
            <td>' . $item->name . '</td>
            <td width="35%">
            <button
            class="btn btn-danger" id = "deleteItem" value=' . $item->id . '>Delete</button>
            </td>
          </tr>';
            }  
        }
        else{
            $addedItems .= '<tr id="item' . ' class="active">
            <td> No item to show' .'</td>
          </tr>';
        }

        $data = array(
            'items'  => $items,
            'addedItems' => $addedItems,
        );
        return response()->json($data);
    }
}
