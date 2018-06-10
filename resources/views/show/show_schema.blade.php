@extends('layouts.master')


@section('content')

@include('partials.flash_message')
@include('tables.scripts')     
		<!-- drag container -->
                <h1 align="center">{{ $schema->schema_name }}</h1>
		<div id="redips-drag">
                    <!-- table2 -->
                    <table id="table2">
                        <colgroup>
                            <col width="100"/>
                            <col width="100"/>
                            <col width="100"/>
                            <col width="100"/>
                        </colgroup>
                            <tbody>
                                @for($i = 0; $i < 7; $i++)
                                <tr>
                                    @for($j = 0; $j < 7; $j++)
                                        <td></td>
                                    @endfor
                                </tr>
                                @endfor
                                <tr><td></td><td></td><td></td><td></td><td></td><td></td><td id="lastCell"></td></tr>
                            </tbody>
                    </table>
                    
                    <div class="row">
                        <div class="col-lg-6 col-xs-offset-4">
                            <input type="button" id="back_from_update"  value="Back" onclick="window.history.back();" class="btn btn-danger">
                        </div>
                    </div>
		</div>
                
		<!-- jQuery dialog -->
		<div id="dialog" title="jQuery dialog">Please choose action!</div>
		<!-- instructions -->
                
                <script>
                    
                    redips.targetTable = document.getElementById('table2');
                    var table_content = <?php echo json_encode($schema); ?>;
                    REDIPS.drag.loadContent(redips.targetTable, table_content['table_coord']);
                    
                   DisableDrag();
                   var table_bookings = <?php echo json_encode($table_bookings); ?>;
                   MarkBookedTables(table_bookings);

                </script>
                
	</body>
</html>

@endsection