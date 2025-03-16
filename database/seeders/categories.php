<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class categories extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('categories')->insert(
            [
                [ 'name_en' =>"Cooking range",],
                [ 'name_en' =>"Refrigerator",],
                [ 'name_en' =>"Laundry",],
                [ 'name_en' =>"Dishwashers",],
                [ 'name_en' =>"Microwaves",],
                [ 'name_en' =>"Small Cooking Appliances",],
                [ 'name_en' =>"Air Treatment",],
                [ 'name_en' =>"Vacuum Cleaner",],
                [ 'name_en' =>"Water Treatment",],
            ]
        );
    }
}
