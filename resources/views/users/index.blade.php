@extends('app')
@section('heading')
	<flux:heading size="lg" level="1">Users</flux:heading>
	{{--    --}}
	{{--    <flux:subheading size="md" class="mb-6">Here is a list of users.</flux:subheading>--}}
@endsection
@section('content')
	
	<flux:table>
		<flux:table.columns>
			<flux:table.column>Name</flux:table.column>
			<flux:table.column>Role</flux:table.column>
			<flux:table.column>Status</flux:table.column>
		</flux:table.columns>
		
		<flux:table.rows>
			@foreach($users as $user)
				<flux:table.row>
					<flux:table.cell>
						<flux:modal.trigger :name="'edit-profile-'.$user->id">
							<a href="#">{{ $user->full_name }}</a>
						</flux:modal.trigger>
						<flux:modal :name="'edit-profile-'.$user->id">
							<div class="pl-2 pt-4">
								<flux:editor />
							</div>
						</flux:modal>
					
					</flux:table.cell>
					<flux:table.cell>{{ $user->role }}</flux:table.cell>
					<flux:table.cell>
						<flux:badge
								color="{{ $user->status == \App\Enums\UserStatus::Active->value ? 'green' : 'red' }}"
								size="sm" inset="top bottom">{{ $user->status }}</flux:badge>
					</flux:table.cell>
				
				</flux:table.row>
			@endforeach
		</flux:table.rows>
	</flux:table>
@endsection