<?php

namespace App\Http\Controllers;

use App\Menu;
use App\Item;
use Illuminate\Http\Request;

class MenuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {   
        $menus = Menu::pluck('name', 'id');
        
        return view('menus.create')
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function show(Menu $menu)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function edit(Menu $menu)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Menu $menu)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function destroy(Menu $menu)
    {
        //
    }

    public function action(Request $request)
    {
        $items = null;
        $newMenuId = null;
        $newMenuName = null;
        if($request->add){
            $item_name = $request->add;
            $menu_id = $request->menu_id;
            $item = new Item();
            $item->name = $item_name;
            $item->menu_id = $menu_id;
            $item->save();
            $items = Menu::find($menu_id)->items;
        }else if($request->itemId && $request->menu_id ){
            $menu_id = $request->menu_id;
            $delete_id = $request->itemId;
            $item = Item::find($delete_id);
            Item::find($delete_id)->delete();
            $items = Menu::find($menu_id)->items;
        }
        else if($request->menu_id && $request->new_menu_name){
            $menu_id = $request->menu_id;
            $new_menu_name = $request->new_menu_name;
            $changedMenu = Menu::find($menu_id);
            $changedMenu->name = $new_menu_name;
            $changedMenu->save();
            $items = Menu::find($menu_id)->items;
            $newMenuId = $menu_id;
            $newMenuName = $new_menu_name;
        }
        else if ($request->menuName) {
            $menu = new Menu();
            $menu->name = $request->menuName;
            if($menu->save()){
                $newMenuId = $menu->id;
                $newMenuName = $menu->name;
            }
            $items = null;
        }
        else if ($request->menu_id) {
            $menu_id = $request->menu_id;
            $items = Menu::find($menu_id)->items;
        }
        // $menus = Menu::pluck('name', 'id');
        if($items){
            foreach ($items as $item) {
                $items.=    '<tr id="item' . $item->id . ' class="active">
            <td>' . $item->id . '</td>
            <td>' . $item->name . '</td>
            <td width="35%">
            <button
            class="btn btn btn-danger" id = "deleteItem" value=' . $item->id . '>Delete</button>
            </td>
          </tr>';
            }
        }
        else{
           $items.= '<tr id="item' .' class="active">
            <td> No item to show' .'</td>
          </tr>';
        }

        $data = array(
            'items'  => $items,
            'newMenuId'  => $newMenuId,
            'newMenuName' => $newMenuName,
        );
        return response()->json($data);
    }

}
