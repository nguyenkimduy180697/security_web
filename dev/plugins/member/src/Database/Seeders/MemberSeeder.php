<?php

namespace Dev\Member\Database\Seeders;

use Dev\Base\Models\BaseModel;
use Dev\Base\Supports\BaseSeeder;
use Dev\Member\Models\Member;
use Dev\Member\Models\MemberActivityLog;
use Dev\Slug\Facades\SlugHelper;
use Illuminate\Support\Facades\Hash;

class MemberSeeder extends BaseSeeder
{
    public function run(): void
    {
        Member::query()->truncate();
        MemberActivityLog::query()->truncate();

        $memberData = $this->getMemberData();

        foreach ($memberData as $data) {
            /**
             * @var Member $member
             */
            $member = Member::query()->create($data);

            SlugHelper::createSlug($member);
        }
    }

    protected function getMemberData(): array
    {
        $faker = $this->fake();
        $now = $this->now();

        $data = [
            [
                'id' => BaseModel::isUsingIntegerId() ? 1 : $faker->uuid(),
                'first_name' => $faker->firstName(),
                'last_name' => $faker->lastName(),
                'email' => 'member@gmail.com',
                'password' => Hash::make('12345678'),
                'confirmed_at' => $now,
                'created_at' => $now,
                'updated_at' => $now,
            ],
        ];

        for ($i = 2; $i < 11; $i++) {
            $data[] = [
                'id' => BaseModel::isUsingIntegerId() ? $i : $faker->uuid(),
                'first_name' => $faker->firstName(),
                'last_name' => $faker->lastName(),
                'email' => $faker->email(),
                'password' => Hash::make('12345678'),
                'confirmed_at' => $now,
                'created_at' => $now,
                'updated_at' => $now,
            ];
        }

        return $data;
    }
}
