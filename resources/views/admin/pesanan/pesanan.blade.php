@extends('admin.layouts.master')

@section('content')
    <div class="page-title-box">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-sm-6">
                    <div class="page-title">
                        <h4>Pesanan Customer</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">

        <div class="page-content-wrapper">
            @php
                function rupiah($angka)
                {
                    $hasil_rupiah = 'Rp ' . number_format($angka, 2, ',', '.');
                    return $hasil_rupiah;
                }

                function tgl_indo($tanggal)
                {
                    $bulan = [
                        1 => 'Januari',
                        'Februari',
                        'Maret',
                        'April',
                        'Mei',
                        'Juni',
                        'Juli',
                        'Agustus',
                        'September',
                        'Oktober',
                        'November',
                        'Desember',
                    ];
                    $pecahkan = explode('-', $tanggal);

                    // variabel pecahkan 0 = tanggal
                    // variabel pecahkan 1 = bulan
                    // variabel pecahkan 2 = tahun

                    return $pecahkan[2] . ' ' . $bulan[(int) $pecahkan[1]] . ' ' . $pecahkan[0];
                }
            @endphp
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Pesanan Tiket Konser</h4>
                            @error('resi')
                                <div class="alert alert-danger mb-2" role="alert">
                                    {{ $message }}
                                </div>
                            @enderror
                            <ul class="nav nav-tabs nav-tabs-custom nav-justified" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-bs-toggle="tab" href="#home1" role="tab">
                                        <span class="d-block d-sm-none"><i class="fas fa-home"></i></span>
                                        <span class="d-none d-sm-block">Konfirmasi Pembayaran</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" href="#profile1" role="tab">
                                        <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                                        <span class="d-none d-sm-block">Konfirmasi Pesanan</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" href="#messages1" role="tab">
                                        <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                                        <span class="d-none d-sm-block">Pesanan Dikirim</span>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content p-3 text-muted">
                                <div class="tab-pane active" id="home1" role="tabpanel">
                                    <p class="mb-0">
                                    <div class="table-responsive">
                                        <table class="table table-centered datatable dt-responsive nowrap "
                                            style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>ID Tiket</th>
                                                    <th>Nama Tiket</th>
                                                    <th>Quantity</th>
                                                    <th>Status Pembayaran</th>
                                                    <th style="width: 120px;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($konfirmasi as $konfirmasi)
                                                    <tr>
                                                        <td><a href="javascript: void(0);"
                                                                class="text-dark fw-bold">#P00{{ $konfirmasi->id_pesanan }}</a>
                                                        </td>
                                                        <td>
                                                            {{ Str::title($konfirmasi->nama_produk) }}
                                                        </td>
                                                        <td style="text-align: center">
                                                            {{ $konfirmasi->quantity }} Pcs
                                                        </td>
                                                        <td style="text-align: center">
                                                            <div class="badge badge-soft-danger font-size-12">
                                                                Menunggu Konfirmasi</div><br>
                                                            <a href="" data-bs-toggle="modal"
                                                                data-bs-target="#myModal-{{ $konfirmasi->id_pesanan }}"><u>Bukti
                                                                    Pembayaran</u></a>
                                                        </td>
                                                        <td>
                                                            <a href="{{ route('pesananAdmin.konfirm_pesanan', $konfirmasi->id_pesanan) }}"
                                                                class="me-3 text-success"
                                                                onclick="return confirm('Apakah Yakin Pembayaran Telah Sesuai ?');"><i
                                                                    class="mdi mdi-check-bold font-size-18"></i> Setuju</a>
                                                            <a href="{{ route('pesananAdmin.tolak_pesanan', $konfirmasi->id_pesanan) }}"
                                                                class="text-danger"
                                                                onclick="return confirm('Apakah Yakin Menolak Pembayaran ?');"><i
                                                                    class="mdi mdi-clipboard-text-off font-size-18"></i>
                                                                Tolak</a>
                                                        </td>
                                                    </tr>
                                                    <div id="myModal-{{ $konfirmasi->id_pesanan }}" class="modal fade"
                                                        tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                                                        aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-body">
                                                                    <h5 class="header-title">Bukti Pembayaran
                                                                        #P00{{ $konfirmasi->id_pesanan }}</h5>
                                                                    <p class="card-title-desc">Bukti Pembayaran Tiket</p>
                                                                    <dl class="row mb-0">
                                                                        <dt class="col-sm-4">Nama Tiket</dt>
                                                                        <dd class="col-sm-8">
                                                                            {{ Str::title($konfirmasi->nama_produk) }}</dd>
                                                                        <dt class="col-sm-4">Total Pesanan</dt>
                                                                        <dd class="col-sm-8">{{ $konfirmasi->quantity }}
                                                                            tiket
                                                                        </dd>
                                                                        <dt class="col-sm-4">Berat</dt>
                                                                        <dd class="col-sm-8">
                                                                            {{ $konfirmasi->quantity * 145 }} Gram</dd>
                                                                        <dt class="col-sm-4">Variasi </dt>
                                                                        <dd class="col-sm-8">{{ $konfirmasi->variasi }}
                                                                        </dd>
                                                                        <dt class="col-sm-4">Tiket</dt>
                                                                        <dd class="col-sm-8">{{ $konfirmasi->sablon }}</dd>
                                                                        <dt class="col-sm-4">Ongkir </dt>
                                                                        <dd class="col-sm-8">@php
                                                                            echo rupiah($konfirmasi->ongkir) . ' [ ' . $konfirmasi->nama_kota . ' ]';
                                                                        @endphp</dd>
                                                                        <dt class="col-sm-4">Total Tagihan </dt>
                                                                        <dd class="col-sm-8">@php
                                                                            echo rupiah($konfirmasi->total_bayar);
                                                                        @endphp</dd>
                                                                    </dl>
                                                                    <p class="card-title-desc">Bukti Pembayaran / <span
                                                                            class="text-danger">* Klik Foto Untuk
                                                                            Zoom</span></p>
                                                                    <img src='/bukti_bayar/{{ $konfirmasi->bukti_bayar }}'
                                                                        width='100' height='100' data-action="zoom" />
                                                                </div>
                                                            </div><!-- /.modal-content -->
                                                        </div><!-- /.modal-dialog -->
                                                    </div><!-- /.modal -->
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                    </p>
                                </div>
                                <div class="tab-pane" id="profile1" role="tabpanel">
                                    <p class="mb-0">
                                    <div class="table-responsive">
                                        <table class="table table-centered datatable dt-responsive nowrap "
                                            style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>ID Tiket</th>
                                                    <th>Nama Tiket</th>
                                                    <th>Nama Pemesan</th>
                                                    <th>Bukti Pembayaran</th>
                                                    <th>Cetak Orderan</th>
                                                    <th style="width: 120px;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($ongoing as $ongoing)
                                                    <tr>
                                                        <td><a href="javascript: void(0);"
                                                                class="text-dark fw-bold">#P00{{ $ongoing->id_pesanan }}</a>
                                                        </td>
                                                        <td>
                                                            {{ Str::title($ongoing->nama_produk) }}
                                                        </td>
                                                        <td style="text-align: center" class="text-dark fw-bold">
                                                            {{ Str::title($ongoing->nama) }}
                                                        </td>
                                                        <td style="text-align: center">
                                                            <a href="" data-bs-toggle="modal"
                                                                data-bs-target="#request-{{ $ongoing->id_pesanan }}"><u>
                                                                    Lihat Bukti </u></a>
                                                        </td>
                                                        <td style="text-align: center">
                                                            <a href="{{ route('pesananAdmin.cetak_pesanan', $ongoing->id_pesanan) }}"
                                                                class="btn btn-secondary"><i
                                                                    class="mdi mdi-note-outline"></i> Cetak</a>
                                                        </td>
                                                        <td>
                                                            <a href="" class="me-3 text-success"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#resi-{{ $ongoing->id_pesanan }}"><i
                                                                    class="mdi mdi-fast font-size-18"></i> konfirmasi</a>
                                                        </td>
                                                    </tr>
                                                    <div id="resi-{{ $ongoing->id_pesanan }}" class="modal fade"
                                                        tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                                                        aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-body">
                                                                    <form
                                                                        action="{{ route('pesananAdmin.store_resi', $ongoing->id_pesanan) }}"
                                                                        method="post">
                                                                        <label for="">ID Tiket :
                                                                            #P00{{ $ongoing->id_pesanan }}</label>
                                                                        @csrf
                                                                        @method('put')
                                                                        <input class="form-control mb-3" name="resi"
                                                                            type="text"
                                                                            placeholder=" ID Tiket "
                                                                            id="example-text-input">
                                                                        <button type="submit"
                                                                            class="btn btn-primary w-100"
                                                                            onclick="return confirm('Apakah ID Tiket Sudah benar?');">Kirim
                                                                            Tiket</button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="request-{{ $ongoing->id_pesanan }}" class="modal fade"
                                                        tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                                                        aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-body">
                                                                    @if (!empty($ongoing->desain))
                                                                        <a
                                                                            href="{{ route('pesananAdmin.download', $ongoing->id_pesanan) }}">
                                                                            Download Tiket</a>
                                                                    @endif
                                                                    <br><br>
                                                                    <textarea name="" id="" cols="30" rows="10" disabled>
                                                                        {{ $ongoing->request_user }}
                                                                    </textarea>
                                                                </div>
                                                            </div><!-- /.modal-content -->
                                                        </div><!-- /.modal-dialog -->
                                                    </div>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                    </p>
                                </div>
                                <div class="tab-pane" id="messages1" role="tabpanel">
                                    <p class="mb-0">
                                    <div class="table-responsive">
                                        <table class="table table-centered datatable dt-responsive nowrap "
                                            style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>ID Tiket</th>
                                                    <th>Nama Tiket </th>
                                                    <th>Tanggal Kirim</th>
                                                    <th>No Tiket</th>
                                                    <th style="width: 120px;">Invoice</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($kirim as $kirim)
                                                    <tr>
                                                        <td><a href="javascript: void(0);"
                                                                class="text-dark fw-bold">#P00{{ $kirim->id_pesanan }}</a>
                                                        </td>
                                                        <td>
                                                            {{ Str::title($kirim->nama_produk) . ' [ Quantity : ' . $kirim->quantity . ' ] ' }}
                                                        </td>
                                                        <td style="text-align: center">
                                                            {{ $kirim->updated_at }}
                                                        </td>
                                                        <td style="text-align: center">
                                                            <i>{{ $kirim->no_resi }}</i>
                                                        </td>
                                                        <td style="text-align: center">
                                                            <a href="{{ route('pesananAdmin.cetak_pesanan', $kirim->id_pesanan) }}"
                                                                class="btn btn-secondary"><i
                                                                    class="mdi mdi-note-outline"></i> Cetak</a>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                    </p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('css')
    <style>
        .container {
            margin: 50px;
            max-width: 700px;
        }

        .container img {
            width: 100%;
        }

        .container .pull-left {
            width: 55%;
            float: left;
            margin: 20px 20px 20px -80px;
        }

        @media (min-width: 750px) {
            body {
                font-size: 16px;
                line-height: 1.6;
            }

            .container {
                margin: 100px auto;
            }
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/js/zoom.css">
    <link href="/morvin/dist/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet"
        type="text/css" />

    <!-- Responsive datatable examples -->
    <link href="/morvin/dist/assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet"
        type="text/css" />
@endsection

@section('js')
    <script>
        window.setTimeout(function() {
            $(".alert").fadeTo(500, 0).slideUp(500, function() {
                $(this).remove();
            });
        }, 2500);
    </script>
    <script src="/js/zoom.js"></script>
    <script src="/morvin/dist/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="/morvin/dist/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>

    <!-- Responsive examples -->
    <script src="/morvin/dist/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="/morvin/dist/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

    <script src="/morvin/dist/assets/js/pages/ecommerce-datatables.init.js"></script>
@endsection
